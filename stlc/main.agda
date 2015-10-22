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

ctxtm-add-span : ∀{A : Set} → span → ctxtm A → ctxtm A
ctxtm-add-span s m Γ = m (add-span s Γ)

ctxtm-declare-var : ∀{A : Set} → var → type → ctxtm ⊤
ctxtm-declare-var x tp (mk-ctxt T ss) = just triv , (mk-ctxt (trie-insert T x tp) ss)

ctxtm-undeclare-var : ∀{A : Set} → var → ctxtm ⊤
ctxtm-undeclare-var x (mk-ctxt T ss) = just triv , (mk-ctxt (trie-remove T x) ss)

ctxtm-lookup : posinfo → var → posinfo → ctxtm type
ctxtm-lookup p1 x p2 (mk-ctxt T ss) with trie-lookup T x 
ctxtm-lookup p1 x p2 (mk-ctxt T ss) | nothing = 
  nothing , add-span (mk-span "var" p1 p2 [ "error" , "Undefined variable" ]) (mk-ctxt T ss)
ctxtm-lookup p1 x p2 (mk-ctxt T ss) | just tp = just tp , (mk-ctxt T ss)

ctxtm-fail : ∀{A : Set} → ctxtm A
ctxtm-fail Γ = nothing , Γ

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

synth-term : term → ctxtm type
check-term : term → type → ctxtm ⊤ 
synth-term (App t t₁) = {!!}
synth-term (Ascribe p1 t tp p2) = {!!}
synth-term (Hole p1 p2) = {!!}
synth-term (Lam p x t) = {!!}
synth-term (Paren p1 t p2) = {!!}
synth-term (Var p1 x p2) = ctxtm-lookup p1 x p2
check-term (App t t₁) tp = {!!}
check-term (Ascribe p1 t tp p2) tp' = {!!}
check-term (Hole p1 p2) tp = {!!}
check-term (Lam p x t) tp = {!!}
check-term (Paren p1 t p2) tp = {!!}
check-term (Var p1 x p2) tp = ctxtm-lookup p1 x p2 ≫c assert-eq tp

process-cmd : ctxt → cmd → ctxt
process-cmd Γ (DefCheck i1 x trm tp i2) = add-span (mk-span "DefCheck" i1 i2 []) Γ
process-cmd Γ (DefSynth i1 x trm i2) = add-span (mk-span "DefSynth" i1 i2 []) Γ
process-cmd Γ (DefTp i1 x tp i2) = add-span (mk-span "DefTp" i1 i2 []) Γ

process-cmds : ctxt → cmds → ctxt
process-cmds Γ (CmdsNext c cs) = process-cmds (process-cmd Γ c) cs 
process-cmds Γ (CmdsStart c) = process-cmd Γ c

process-start : start → string
process-start (Cmds cs) with process-cmds empty-ctxt cs
process-start (Cmds cs) | mk-ctxt T ss = "{\"spans\":[" ^ spans-to-string ss ^ "]}\n"

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

