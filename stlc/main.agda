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

compose-span : string → string → string → string
compose-span name start end = "[\"" ^ name ^ "\"," ^ start ^ "," ^ end ^ "]"

process-cmd : cmd → string
process-cmd (DefCheck i1 x trm tp i2) with trm
... | (Hole hi1 hi2) = compose-span "DefCheck" i1 i2 ^ "," ^ compose-span "Hole" hi1 hi2
... | _ = compose-span "DefCheck" i1 i2
process-cmd (DefSynth i1 x trm i2) with trm
... | (Hole hi1 hi2) = compose-span "DefSynth" i1 i2 ^ "," ^ compose-span "Hole" hi1 hi2
... | _ = compose-span "DefSynth" i1 i2
process-cmd (DefTp i1 x tp i2) = compose-span "DefTp" i1 i2

process-cmds : cmds → string
process-cmds (CmdsNext c cs) = process-cmd c ^ "," ^ process-cmds cs
process-cmds (CmdsStart c) = process-cmd c

process-start : start → string
process-start (Cmds cs) = "{\"spans\":[" ^ process-cmds cs ^ "]}\n"

process : Run → string
process (ParseTree (parsed-start p) :: []) = process-start p
process r = "Parsing failure (run with -" ^ "-showParsed).\n"

putStrRunIf : 𝔹 → Run → IO ⊤
putStrRunIf tt r = putStr (Run-to-string r) >> putStr "\n"
putStrRunIf ff r = return triv

processArgs : (showRun : 𝔹) → (showParsed : 𝔹) → 𝕃 string → IO ⊤ 
processArgs showRun showParsed (input-filename :: []) = (readFiniteFile input-filename) >>= processText
  where processText : string → IO ⊤
        processText x with runRtn (string-to-𝕃char x)
        processText x | s with s
        processText x | s | inj₁ cs = putStr "Characters left before failure : " >> putStr (𝕃char-to-string cs) >> putStr "\nCannot proceed to parsing.\n"
        processText x | s | inj₂ r with putStrRunIf showRun r | rewriteRun r
        processText x | s | inj₂ r | sr | r' with putStrRunIf showParsed r'
        processText x | s | inj₂ r | sr | r' | sr' = sr >> sr' >> putStr (process r')
                                     
processArgs showRun showParsed ("--showRun" :: xs) = processArgs tt showParsed xs 
processArgs showRun showParsed ("--showParsed" :: xs) = processArgs showRun tt xs 
processArgs showRun showParsed (x :: xs) = putStr ("Unknown option " ^ x ^ "\n")
processArgs showRun showParsed [] = putStr "Please run with the name of a file to process.\n"

main : IO ⊤
main = getArgs >>= processArgs ff ff

