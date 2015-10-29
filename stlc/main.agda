module main where

import parse
open import lib
open import stlc-types
import stlc

module parsem = parse stlc.gratr2-nt ptr
open parsem
open parsem.pnoderiv stlc.rrs stlc.stlc-rtn
open import run ptr
open noderiv {- from run.agda -}

start-pos : term → posinfo
start-pos (App t t') = start-pos t
start-pos (Ascribe p _ _ p') = p
start-pos (Hole p p') = p
start-pos (Lam p x t) = p
start-pos (Paren p t p') = p
start-pos (Var p x p') = p

end-pos : term → posinfo
end-pos (App t t') = end-pos t'
end-pos (Ascribe p _ _ p') = p'
end-pos (Hole p p') = p'
end-pos (Lam p x t) = end-pos t
end-pos (Paren p t p') = p'
end-pos (Var p x p') = p'

escape-string-h : 𝕃 char → 𝕃 char
escape-string-h ('\n' :: cs) = '\\' :: 'n' :: (escape-string-h cs)
escape-string-h ('"' :: cs) = '\\' :: '"' :: (escape-string-h cs)
escape-string-h (c :: cs) = c :: escape-string-h cs
escape-string-h [] = []

escape-string : string → string
escape-string s = 𝕃char-to-string( escape-string-h( string-to-𝕃char s ) )

compose-error : string → string
compose-error msg = "{\"error\":\"" ^ escape-string(msg) ^ "\"}\n"

tagged-val : Set
tagged-val = string × string

tagged-val-to-string : tagged-val → string
tagged-val-to-string (tag , val) = tag ^ ":" ^ val

data span : Set where
  mk-span : string → posinfo → posinfo → 𝕃 tagged-val {- extra information for the span -} → span


span-to-string : span → string
span-to-string (mk-span name start end extra) = 
  "[\"" ^ name ^ "\"," ^ start ^ "," ^ end ^ ",{" 
        ^ string-concat-sep-map "," tagged-val-to-string extra ^ "}]"


spans-to-string : 𝕃 span → string
spans-to-string = string-concat-sep-map "," span-to-string 

data ctxt : Set where
  mk-ctxt : trie type → 𝕃 span → ctxt

empty-ctxt : ctxt
empty-ctxt = mk-ctxt empty-trie []

add-span : span → ctxt → ctxt
add-span s (mk-ctxt T ss) = mk-ctxt T (s :: ss)

ctxtm : Set → Set
ctxtm A = ctxt → maybe A × ctxt -- the maybe type is for when there is an error (but the error will get added to a span)

ctxtm-return : ∀{A : Set} → A → ctxtm A
ctxtm-return a = λ c → just a , c

ctxtm-bind : ∀{A B : Set} → ctxtm A → (A → ctxtm B) → ctxtm B
ctxtm-bind m1 f Γ with m1 Γ
ctxtm-bind m1 f _ | just a , Γ = f a Γ
ctxtm-bind m1 f _ | nothing , Γ = nothing , Γ

_≫c_ : ∀{A B : Set} → ctxtm A → (A → ctxtm B) → ctxtm B
_≫c_ = ctxtm-bind

ctxtm-bind' : ∀{A : Set} → ctxtm ⊤ → ctxtm A → ctxtm A
ctxtm-bind' m1 m2 Γ with m1 Γ
ctxtm-bind' m1 m2 _ | _ , Γ = m2 Γ

_≫c'_ : ∀{A : Set} → ctxtm ⊤ → ctxtm A → ctxtm A
_≫c'_ = ctxtm-bind'

infixr 2 _≫c_ _≫c'_

ctxtm-fail : ∀{A : Set} → ctxtm A
ctxtm-fail Γ = nothing , Γ

ctxtm-ok : ctxtm ⊤
ctxtm-ok = λ c → just triv , c

ctxtm-add-span : ∀{A : Set} → span → ctxtm A → ctxtm A
ctxtm-add-span s m Γ = m (add-span s Γ)

ctxtm-declare-var : var → type → ctxtm ⊤
ctxtm-declare-var x tp (mk-ctxt T ss) = just triv , (mk-ctxt (trie-insert T x tp) ss)

ctxtm-undeclare-var : ∀{A : Set} → var → ctxtm ⊤
ctxtm-undeclare-var x (mk-ctxt T ss) = just triv , (mk-ctxt (trie-remove T x) ss)

ctxtm-error-span : ∀{A : Set} → posinfo → posinfo → string → string → ctxtm A
ctxtm-error-span p1 p2 label errmsg = ctxtm-add-span (mk-span label p1 p2 [ "error" , errmsg ]) ctxtm-fail

ctxtm-lookup : posinfo → var → posinfo → ctxtm type
ctxtm-lookup p1 x p2 (mk-ctxt T ss) with trie-lookup T x 
ctxtm-lookup p1 x p2 (mk-ctxt T ss) | nothing = ctxtm-error-span p1 p2 "var" "Undefined variable" (mk-ctxt T ss)
ctxtm-lookup p1 x p2 (mk-ctxt T ss) | just tp = just tp , (mk-ctxt T ss)

unimplemented = ctxtm-fail

ctxtm-&& : ctxtm 𝔹 → ctxtm 𝔹 → ctxtm 𝔹
ctxtm-&& c1 c2 = c1 ≫c λ b1 → c2 ≫c λ b2 → ctxtm-return (b1 && b2)

{-# NO_TERMINATION_CHECK #-}
assert-eq : type → type → ctxtm ⊤
assert-eq t1 (TpParens t2) = assert-eq t1 t2 
assert-eq (TpParens t1) t2 = assert-eq t1 t2 
assert-eq (Arrow t1 t2) (Arrow t1' t2') = 
  assert-eq t1 t1' ≫c' assert-eq t2 t2'
assert-eq t1 (TpVar p1 x p2) = 
  ctxtm-lookup p1 x p2 ≫c assert-eq t1 
assert-eq (TpVar p1 x p2) t1 = ctxtm-lookup p1 x p2 ≫c assert-eq t1

synth-error : posinfo → posinfo → string → string → ctxtm type
synth-error p1 p2 label name = ctxtm-error-span p1 p2 label (name ^ " encountered in synthesizing position")

check-error : posinfo → posinfo → string → string → ctxtm type
check-error p1 p2 label name = ctxtm-error-span p1 p2 label (name ^ " encountered in checking position")

synth-term : term → ctxtm type
check-term : term → type → ctxtm ⊤ 
synth-term (App t t₁) = unimplemented
synth-term (Ascribe p1 t tp p2) = unimplemented
synth-term (Hole p1 p2) = synth-error p1 p2 "hole" "Hole"
synth-term (Lam p x t) = synth-error p (end-pos t) "lambda" "Lambda"
synth-term (Paren p1 t p2) = synth-term t
synth-term (Var p1 x p2) = ctxtm-lookup p1 x p2
check-term (App t t₁) tp = unimplemented
check-term (Ascribe p1 t tp p2) tp' = unimplemented
check-term (Hole p1 p2) tp = ctxtm-add-span (mk-span "hole" p1 p2 []) ctxtm-ok
check-term (Lam p x t) tp = unimplemented
check-term (Paren p1 t p2) tp = check-term t tp
check-term (Var p1 x p2) tp = ctxtm-lookup p1 x p2 ≫c assert-eq tp

process-cmd : cmd → ctxtm ⊤
process-cmd (DefCheck i1 x trm tp i2) = ctxtm-add-span (mk-span "DefCheck" i1 i2 []) (check-term trm tp)
process-cmd (DefSynth i1 x trm i2) = synth-term trm ≫c λ tp → ctxtm-add-span (mk-span "DefSynth" i1 i2 []) (ctxtm-declare-var x tp)
process-cmd (DefTp i1 x tp i2) = ctxtm-add-span (mk-span "DefTp" i1 i2 []) unimplemented

process-cmds : cmds → ctxtm ⊤
process-cmds (CmdsNext c cs) = process-cmd c ≫c' process-cmds cs
process-cmds (CmdsStart c) = process-cmd c

process-start : start → string
process-start (Cmds cs) with process-cmds cs empty-ctxt
process-start (Cmds cs) | _ , mk-ctxt T ss = "{\"spans\":[" ^ spans-to-string ss ^ "]}\n"

process : Run → string
process (ParseTree (parsed-start p) :: []) = process-start p
process r = compose-error("Parsing failure (run with -" ^ "-showParsed).\n")

putStrRunIf : 𝔹 → Run → IO ⊤
putStrRunIf tt r = putStr (Run-to-string r) >> putStr "\n"
putStrRunIf ff r = return triv

processArgs : (showRun : 𝔹) → (showParsed : 𝔹) → 𝕃 string → IO ⊤ 
processArgs showRun showParsed (input-filename :: []) = (readFiniteFile input-filename) >>= processText
  where processText : string → IO ⊤
        processText x with runRtn (string-to-𝕃char x)
        processText x | s with s
        processText x | s | inj₁ cs = putStr( compose-error(
                    "Characters left before failure : " ^ (𝕃char-to-string cs) ^ "\nCannot proceed to parsing.\n" ) )
        processText x | s | inj₂ r with putStrRunIf showRun r | rewriteRun r
        processText x | s | inj₂ r | sr | r' with putStrRunIf showParsed r'
        processText x | s | inj₂ r | sr | r' | sr' = sr >> sr' >> putStr (process r')
                                     
processArgs showRun showParsed ("--showRun" :: xs) = processArgs tt showParsed xs 
processArgs showRun showParsed ("--showParsed" :: xs) = processArgs showRun tt xs 
processArgs showRun showParsed (x :: xs) = putStr ("Unknown option " ^ x ^ "\n")
processArgs showRun showParsed [] = putStr "Please run with the name of a file to process.\n"

main : IO ⊤
main = getArgs >>= processArgs ff ff

