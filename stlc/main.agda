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

tag : Set
tag = string × string

data span : Set where
  mk-span : string → posinfo → posinfo → 𝕃 tag {- extra information for the span -} → span

span-to-string : span → string
span-to-string (mk-span name start end extra) = "[\"" ^ name ^ "\"," ^ start ^ "," ^ end ^ ",{" ^ h extra ^ "}]"
  where h : 𝕃 tag → string
        h [] = ""
        h ((tag , val) :: ts) = tag ^ ":" ^ val ^ h ts

spans-to-string : 𝕃 span → string
spans-to-string ss = string-concat-sep "," (map span-to-string ss)

data ctxt : Set where
  mk-ctxt : trie type → 𝕃 span → ctxt

empty-ctxt : ctxt
empty-ctxt = mk-ctxt empty-trie []

add-span : span → ctxt → ctxt
add-span s (mk-ctxt T ss) = mk-ctxt T (s :: ss)

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

