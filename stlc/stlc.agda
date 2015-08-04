module stlc where

open import lib

open import stlc-types public
----------------------------------------------------------------------------------
-- Run-rewriting rules
----------------------------------------------------------------------------------

data gratr2-nt : Set where
  _ws-plus-24 : gratr2-nt
  _ws : gratr2-nt
  _varone-range-3 : gratr2-nt
  _varone-range-2 : gratr2-nt
  _varone-range-1 : gratr2-nt
  _varone-bar-7 : gratr2-nt
  _varone-bar-6 : gratr2-nt
  _varone-bar-5 : gratr2-nt
  _varone-bar-4 : gratr2-nt
  _varone : gratr2-nt
  _var-plus-8 : gratr2-nt
  _var : gratr2-nt
  _type : gratr2-nt
  _term : gratr2-nt
  _start : gratr2-nt
  _posinfo : gratr2-nt
  _ows-star-25 : gratr2-nt
  _ows : gratr2-nt
  _comment-star-20 : gratr2-nt
  _comment : gratr2-nt
  _cmds : gratr2-nt
  _cmd : gratr2-nt
  _aws-bar-23 : gratr2-nt
  _aws-bar-22 : gratr2-nt
  _aws-bar-21 : gratr2-nt
  _aws : gratr2-nt
  _anychar-bar-9 : gratr2-nt
  _anychar-bar-19 : gratr2-nt
  _anychar-bar-18 : gratr2-nt
  _anychar-bar-17 : gratr2-nt
  _anychar-bar-16 : gratr2-nt
  _anychar-bar-15 : gratr2-nt
  _anychar-bar-14 : gratr2-nt
  _anychar-bar-13 : gratr2-nt
  _anychar-bar-12 : gratr2-nt
  _anychar-bar-11 : gratr2-nt
  _anychar-bar-10 : gratr2-nt
  _anychar : gratr2-nt


gratr2-nt-eq : gratr2-nt → gratr2-nt → 𝔹
gratr2-nt-eq  _ws-plus-24 _ws-plus-24 = tt
gratr2-nt-eq  _ws _ws = tt
gratr2-nt-eq  _varone-range-3 _varone-range-3 = tt
gratr2-nt-eq  _varone-range-2 _varone-range-2 = tt
gratr2-nt-eq  _varone-range-1 _varone-range-1 = tt
gratr2-nt-eq  _varone-bar-7 _varone-bar-7 = tt
gratr2-nt-eq  _varone-bar-6 _varone-bar-6 = tt
gratr2-nt-eq  _varone-bar-5 _varone-bar-5 = tt
gratr2-nt-eq  _varone-bar-4 _varone-bar-4 = tt
gratr2-nt-eq  _varone _varone = tt
gratr2-nt-eq  _var-plus-8 _var-plus-8 = tt
gratr2-nt-eq  _var _var = tt
gratr2-nt-eq  _type _type = tt
gratr2-nt-eq  _term _term = tt
gratr2-nt-eq  _start _start = tt
gratr2-nt-eq  _posinfo _posinfo = tt
gratr2-nt-eq  _ows-star-25 _ows-star-25 = tt
gratr2-nt-eq  _ows _ows = tt
gratr2-nt-eq  _comment-star-20 _comment-star-20 = tt
gratr2-nt-eq  _comment _comment = tt
gratr2-nt-eq  _cmds _cmds = tt
gratr2-nt-eq  _cmd _cmd = tt
gratr2-nt-eq  _aws-bar-23 _aws-bar-23 = tt
gratr2-nt-eq  _aws-bar-22 _aws-bar-22 = tt
gratr2-nt-eq  _aws-bar-21 _aws-bar-21 = tt
gratr2-nt-eq  _aws _aws = tt
gratr2-nt-eq  _anychar-bar-9 _anychar-bar-9 = tt
gratr2-nt-eq  _anychar-bar-19 _anychar-bar-19 = tt
gratr2-nt-eq  _anychar-bar-18 _anychar-bar-18 = tt
gratr2-nt-eq  _anychar-bar-17 _anychar-bar-17 = tt
gratr2-nt-eq  _anychar-bar-16 _anychar-bar-16 = tt
gratr2-nt-eq  _anychar-bar-15 _anychar-bar-15 = tt
gratr2-nt-eq  _anychar-bar-14 _anychar-bar-14 = tt
gratr2-nt-eq  _anychar-bar-13 _anychar-bar-13 = tt
gratr2-nt-eq  _anychar-bar-12 _anychar-bar-12 = tt
gratr2-nt-eq  _anychar-bar-11 _anychar-bar-11 = tt
gratr2-nt-eq  _anychar-bar-10 _anychar-bar-10 = tt
gratr2-nt-eq  _anychar _anychar = tt
gratr2-nt-eq _ _ = ff


open import rtn gratr2-nt


stlc-start : gratr2-nt → 𝕃 gratr2-rule
stlc-start _ws-plus-24 = (just "P108" , nothing , just _ws-plus-24 , inj₁ _aws :: inj₁ _ws-plus-24 :: []) :: (just "P107" , nothing , just _ws-plus-24 , inj₁ _aws :: []) :: []
stlc-start _ws = (just "P109" , nothing , just _ws , inj₁ _ws-plus-24 :: []) :: []
stlc-start _varone-range-3 = (just "P61" , nothing , just _varone-range-3 , inj₂ '9' :: []) :: (just "P60" , nothing , just _varone-range-3 , inj₂ '8' :: []) :: (just "P59" , nothing , just _varone-range-3 , inj₂ '7' :: []) :: (just "P58" , nothing , just _varone-range-3 , inj₂ '6' :: []) :: (just "P57" , nothing , just _varone-range-3 , inj₂ '5' :: []) :: (just "P56" , nothing , just _varone-range-3 , inj₂ '4' :: []) :: (just "P55" , nothing , just _varone-range-3 , inj₂ '3' :: []) :: (just "P54" , nothing , just _varone-range-3 , inj₂ '2' :: []) :: (just "P53" , nothing , just _varone-range-3 , inj₂ '1' :: []) :: (just "P52" , nothing , just _varone-range-3 , inj₂ '0' :: []) :: []
stlc-start _varone-range-2 = (just "P51" , nothing , just _varone-range-2 , inj₂ 'Z' :: []) :: (just "P50" , nothing , just _varone-range-2 , inj₂ 'Y' :: []) :: (just "P49" , nothing , just _varone-range-2 , inj₂ 'X' :: []) :: (just "P48" , nothing , just _varone-range-2 , inj₂ 'W' :: []) :: (just "P47" , nothing , just _varone-range-2 , inj₂ 'V' :: []) :: (just "P46" , nothing , just _varone-range-2 , inj₂ 'U' :: []) :: (just "P45" , nothing , just _varone-range-2 , inj₂ 'T' :: []) :: (just "P44" , nothing , just _varone-range-2 , inj₂ 'S' :: []) :: (just "P43" , nothing , just _varone-range-2 , inj₂ 'R' :: []) :: (just "P42" , nothing , just _varone-range-2 , inj₂ 'Q' :: []) :: (just "P41" , nothing , just _varone-range-2 , inj₂ 'P' :: []) :: (just "P40" , nothing , just _varone-range-2 , inj₂ 'O' :: []) :: (just "P39" , nothing , just _varone-range-2 , inj₂ 'N' :: []) :: (just "P38" , nothing , just _varone-range-2 , inj₂ 'M' :: []) :: (just "P37" , nothing , just _varone-range-2 , inj₂ 'L' :: []) :: (just "P36" , nothing , just _varone-range-2 , inj₂ 'K' :: []) :: (just "P35" , nothing , just _varone-range-2 , inj₂ 'J' :: []) :: (just "P34" , nothing , just _varone-range-2 , inj₂ 'I' :: []) :: (just "P33" , nothing , just _varone-range-2 , inj₂ 'H' :: []) :: (just "P32" , nothing , just _varone-range-2 , inj₂ 'G' :: []) :: (just "P31" , nothing , just _varone-range-2 , inj₂ 'F' :: []) :: (just "P30" , nothing , just _varone-range-2 , inj₂ 'E' :: []) :: (just "P29" , nothing , just _varone-range-2 , inj₂ 'D' :: []) :: (just "P28" , nothing , just _varone-range-2 , inj₂ 'C' :: []) :: (just "P27" , nothing , just _varone-range-2 , inj₂ 'B' :: []) :: (just "P26" , nothing , just _varone-range-2 , inj₂ 'A' :: []) :: []
stlc-start _varone-range-1 = (just "P9" , nothing , just _varone-range-1 , inj₂ 'j' :: []) :: (just "P8" , nothing , just _varone-range-1 , inj₂ 'i' :: []) :: (just "P7" , nothing , just _varone-range-1 , inj₂ 'h' :: []) :: (just "P6" , nothing , just _varone-range-1 , inj₂ 'g' :: []) :: (just "P5" , nothing , just _varone-range-1 , inj₂ 'f' :: []) :: (just "P4" , nothing , just _varone-range-1 , inj₂ 'e' :: []) :: (just "P3" , nothing , just _varone-range-1 , inj₂ 'd' :: []) :: (just "P25" , nothing , just _varone-range-1 , inj₂ 'z' :: []) :: (just "P24" , nothing , just _varone-range-1 , inj₂ 'y' :: []) :: (just "P23" , nothing , just _varone-range-1 , inj₂ 'x' :: []) :: (just "P22" , nothing , just _varone-range-1 , inj₂ 'w' :: []) :: (just "P21" , nothing , just _varone-range-1 , inj₂ 'v' :: []) :: (just "P20" , nothing , just _varone-range-1 , inj₂ 'u' :: []) :: (just "P2" , nothing , just _varone-range-1 , inj₂ 'c' :: []) :: (just "P19" , nothing , just _varone-range-1 , inj₂ 't' :: []) :: (just "P18" , nothing , just _varone-range-1 , inj₂ 's' :: []) :: (just "P17" , nothing , just _varone-range-1 , inj₂ 'r' :: []) :: (just "P16" , nothing , just _varone-range-1 , inj₂ 'q' :: []) :: (just "P15" , nothing , just _varone-range-1 , inj₂ 'p' :: []) :: (just "P14" , nothing , just _varone-range-1 , inj₂ 'o' :: []) :: (just "P13" , nothing , just _varone-range-1 , inj₂ 'n' :: []) :: (just "P12" , nothing , just _varone-range-1 , inj₂ 'm' :: []) :: (just "P11" , nothing , just _varone-range-1 , inj₂ 'l' :: []) :: (just "P10" , nothing , just _varone-range-1 , inj₂ 'k' :: []) :: (just "P1" , nothing , just _varone-range-1 , inj₂ 'b' :: []) :: (just "P0" , nothing , just _varone-range-1 , inj₂ 'a' :: []) :: []
stlc-start _varone-bar-7 = (just "P69" , nothing , just _varone-bar-7 , inj₁ _varone-bar-6 :: []) :: (just "P68" , nothing , just _varone-bar-7 , inj₁ _varone-range-1 :: []) :: []
stlc-start _varone-bar-6 = (just "P67" , nothing , just _varone-bar-6 , inj₁ _varone-bar-5 :: []) :: (just "P66" , nothing , just _varone-bar-6 , inj₁ _varone-range-2 :: []) :: []
stlc-start _varone-bar-5 = (just "P65" , nothing , just _varone-bar-5 , inj₁ _varone-bar-4 :: []) :: (just "P64" , nothing , just _varone-bar-5 , inj₂ '\'' :: []) :: []
stlc-start _varone-bar-4 = (just "P63" , nothing , just _varone-bar-4 , inj₁ _varone-range-3 :: []) :: (just "P62" , nothing , just _varone-bar-4 , inj₂ '-' :: []) :: []
stlc-start _varone = (just "P70" , nothing , just _varone , inj₁ _varone-bar-7 :: []) :: []
stlc-start _var-plus-8 = (just "P72" , nothing , just _var-plus-8 , inj₁ _varone :: inj₁ _var-plus-8 :: []) :: (just "P71" , nothing , just _var-plus-8 , inj₁ _varone :: []) :: []
stlc-start _var = (just "P73" , nothing , just _var , inj₁ _var-plus-8 :: []) :: []
stlc-start _type = (just "TpVar" , nothing , just _type , inj₁ _var :: []) :: (just "TpParens" , nothing , just _type , inj₂ '(' :: inj₁ _ows :: inj₁ _type :: inj₁ _ows :: inj₂ ')' :: []) :: []
stlc-start _term = (just "Var" , nothing , just _term , inj₁ _var :: []) :: (just "Paren" , nothing , just _term , inj₂ '(' :: inj₁ _ows :: inj₁ _term :: inj₁ _ows :: inj₂ ')' :: []) :: (just "Lam" , nothing , just _term , inj₂ 'λ' :: inj₁ _ows :: inj₁ _var :: inj₁ _ows :: inj₂ '.' :: inj₁ _ows :: inj₁ _term :: []) :: (just "Hole" , nothing , just _term , inj₂ '●' :: []) :: (just "Ascribe" , nothing , just _term , inj₂ '[' :: inj₁ _ows :: inj₁ _term :: inj₁ _ows :: inj₂ ':' :: inj₁ _ows :: inj₁ _type :: inj₁ _ows :: inj₂ ']' :: []) :: []
stlc-start _start = (just "Cmds" , nothing , just _start , inj₁ _ows :: inj₁ _cmds :: inj₁ _ows :: []) :: []
stlc-start _posinfo = (just "Posinfo" , nothing , just _posinfo , []) :: []
stlc-start _ows-star-25 = (just "P111" , nothing , just _ows-star-25 , inj₁ _aws :: inj₁ _ows-star-25 :: []) :: (just "P110" , nothing , just _ows-star-25 , []) :: []
stlc-start _ows = (just "P112" , nothing , just _ows , inj₁ _ows-star-25 :: []) :: []
stlc-start _comment-star-20 = (just "P98" , nothing , just _comment-star-20 , inj₁ _anychar :: inj₁ _comment-star-20 :: []) :: (just "P97" , nothing , just _comment-star-20 , []) :: []
stlc-start _comment = (just "P99" , nothing , just _comment , inj₂ '%' :: inj₁ _comment-star-20 :: inj₂ '\n' :: []) :: []
stlc-start _cmds = (just "CmdsStart" , nothing , just _cmds , inj₁ _cmd :: []) :: (just "CmdsNext" , nothing , just _cmds , inj₁ _cmd :: inj₁ _ws :: inj₁ _cmds :: []) :: []
stlc-start _cmd = (just "DefTp" , nothing , just _cmd , inj₁ _posinfo :: inj₁ _var :: inj₁ _ows :: inj₂ '=' :: inj₂ 't' :: inj₂ 'y' :: inj₂ 'p' :: inj₂ 'e' :: inj₁ _ows :: inj₁ _type :: inj₁ _ows :: inj₂ '.' :: inj₁ _posinfo :: []) :: (just "DefSynth" , nothing , just _cmd , inj₁ _posinfo :: inj₁ _var :: inj₁ _ows :: inj₂ '=' :: inj₁ _ows :: inj₁ _term :: inj₁ _ows :: inj₂ '.' :: inj₁ _posinfo :: []) :: (just "DefCheck" , nothing , just _cmd , inj₁ _posinfo :: inj₁ _var :: inj₁ _ows :: inj₂ '=' :: inj₁ _ows :: inj₁ _term :: inj₁ _ows :: inj₂ '⇐' :: inj₁ _ows :: inj₁ _type :: inj₁ _ows :: inj₂ '.' :: inj₁ _posinfo :: []) :: []
stlc-start _aws-bar-23 = (just "P105" , nothing , just _aws-bar-23 , inj₁ _aws-bar-22 :: []) :: (just "P104" , nothing , just _aws-bar-23 , inj₂ '\n' :: []) :: []
stlc-start _aws-bar-22 = (just "P103" , nothing , just _aws-bar-22 , inj₁ _aws-bar-21 :: []) :: (just "P102" , nothing , just _aws-bar-22 , inj₂ '\t' :: []) :: []
stlc-start _aws-bar-21 = (just "P101" , nothing , just _aws-bar-21 , inj₁ _comment :: []) :: (just "P100" , nothing , just _aws-bar-21 , inj₂ ' ' :: []) :: []
stlc-start _aws = (just "P106" , nothing , just _aws , inj₁ _aws-bar-23 :: []) :: []
stlc-start _anychar-bar-9 = (just "P75" , nothing , just _anychar-bar-9 , inj₂ '●' :: []) :: (just "P74" , nothing , just _anychar-bar-9 , inj₂ ')' :: []) :: []
stlc-start _anychar-bar-19 = (just "P95" , nothing , just _anychar-bar-19 , inj₁ _anychar-bar-18 :: []) :: (just "P94" , nothing , just _anychar-bar-19 , inj₁ _varone :: []) :: []
stlc-start _anychar-bar-18 = (just "P93" , nothing , just _anychar-bar-18 , inj₁ _anychar-bar-17 :: []) :: (just "P92" , nothing , just _anychar-bar-18 , inj₂ '\t' :: []) :: []
stlc-start _anychar-bar-17 = (just "P91" , nothing , just _anychar-bar-17 , inj₁ _anychar-bar-16 :: []) :: (just "P90" , nothing , just _anychar-bar-17 , inj₂ ' ' :: []) :: []
stlc-start _anychar-bar-16 = (just "P89" , nothing , just _anychar-bar-16 , inj₁ _anychar-bar-15 :: []) :: (just "P88" , nothing , just _anychar-bar-16 , inj₂ '%' :: []) :: []
stlc-start _anychar-bar-15 = (just "P87" , nothing , just _anychar-bar-15 , inj₁ _anychar-bar-14 :: []) :: (just "P86" , nothing , just _anychar-bar-15 , inj₂ '∷' :: []) :: []
stlc-start _anychar-bar-14 = (just "P85" , nothing , just _anychar-bar-14 , inj₁ _anychar-bar-13 :: []) :: (just "P84" , nothing , just _anychar-bar-14 , inj₂ 'λ' :: []) :: []
stlc-start _anychar-bar-13 = (just "P83" , nothing , just _anychar-bar-13 , inj₁ _anychar-bar-12 :: []) :: (just "P82" , nothing , just _anychar-bar-13 , inj₂ '→' :: []) :: []
stlc-start _anychar-bar-12 = (just "P81" , nothing , just _anychar-bar-12 , inj₁ _anychar-bar-11 :: []) :: (just "P80" , nothing , just _anychar-bar-12 , inj₂ ':' :: []) :: []
stlc-start _anychar-bar-11 = (just "P79" , nothing , just _anychar-bar-11 , inj₁ _anychar-bar-10 :: []) :: (just "P78" , nothing , just _anychar-bar-11 , inj₂ '.' :: []) :: []
stlc-start _anychar-bar-10 = (just "P77" , nothing , just _anychar-bar-10 , inj₁ _anychar-bar-9 :: []) :: (just "P76" , nothing , just _anychar-bar-10 , inj₂ '(' :: []) :: []
stlc-start _anychar = (just "P96" , nothing , just _anychar , inj₁ _anychar-bar-19 :: []) :: []


stlc-return : maybe gratr2-nt → 𝕃 gratr2-rule
stlc-return (just _type) = (nothing , nothing , just _type , inj₁ _ows :: inj₂ '→' :: inj₁ _ows :: inj₁ _type :: []) :: []
stlc-return (just _term) = (nothing , nothing , just _term , inj₁ _ws :: inj₁ _term :: []) :: []
stlc-return _ = []

stlc-rtn : gratr2-rtn
stlc-rtn = record { start = _start ; _eq_ = gratr2-nt-eq ; gratr2-start = stlc-start ; gratr2-return = stlc-return }

open import run ptr
open noderiv

------------------------------------------
-- Length-decreasing rules
------------------------------------------

len-dec-rewrite : Run → maybe (Run × ℕ)
len-dec-rewrite {- App-} ((ParseTree (parsed-term x0)) :: (ParseTree parsed-ws) :: _::_(ParseTree (parsed-term x1)) rest) = just (ParseTree (parsed-term (norm-term (App x0 x1))) ::' rest , 3)
len-dec-rewrite {- Arrow-} ((ParseTree (parsed-type x0)) :: (ParseTree parsed-ows) :: (InputChar '→') :: (ParseTree parsed-ows) :: _::_(ParseTree (parsed-type x1)) rest) = just (ParseTree (parsed-type (norm-type (Arrow x0 x1))) ::' rest , 5)
len-dec-rewrite {- Ascribe-} ((Id "Ascribe") :: (InputChar '[') :: (ParseTree parsed-ows) :: (ParseTree (parsed-term x0)) :: (ParseTree parsed-ows) :: (InputChar ':') :: (ParseTree parsed-ows) :: (ParseTree (parsed-type x1)) :: (ParseTree parsed-ows) :: _::_(InputChar ']') rest) = just (ParseTree (parsed-term (norm-term (Ascribe x0 x1))) ::' rest , 10)
len-dec-rewrite {- Cmds-} ((Id "Cmds") :: (ParseTree parsed-ows) :: (ParseTree (parsed-cmds x0)) :: _::_(ParseTree parsed-ows) rest) = just (ParseTree (parsed-start (norm-start (Cmds x0))) ::' rest , 4)
len-dec-rewrite {- CmdsNext-} ((Id "CmdsNext") :: (ParseTree (parsed-cmd x0)) :: (ParseTree parsed-ws) :: _::_(ParseTree (parsed-cmds x1)) rest) = just (ParseTree (parsed-cmds (norm-cmds (CmdsNext x0 x1))) ::' rest , 4)
len-dec-rewrite {- CmdsStart-} ((Id "CmdsStart") :: _::_(ParseTree (parsed-cmd x0)) rest) = just (ParseTree (parsed-cmds (norm-cmds (CmdsStart x0))) ::' rest , 2)
len-dec-rewrite {- DefCheck-} ((Id "DefCheck") :: (ParseTree (parsed-posinfo x0)) :: (ParseTree (parsed-var x1)) :: (ParseTree parsed-ows) :: (InputChar '=') :: (ParseTree parsed-ows) :: (ParseTree (parsed-term x2)) :: (ParseTree parsed-ows) :: (InputChar '⇐') :: (ParseTree parsed-ows) :: (ParseTree (parsed-type x3)) :: (ParseTree parsed-ows) :: (InputChar '.') :: _::_(ParseTree (parsed-posinfo x4)) rest) = just (ParseTree (parsed-cmd (norm-cmd (DefCheck x0 x1 x2 x3 x4))) ::' rest , 14)
len-dec-rewrite {- DefSynth-} ((Id "DefSynth") :: (ParseTree (parsed-posinfo x0)) :: (ParseTree (parsed-var x1)) :: (ParseTree parsed-ows) :: (InputChar '=') :: (ParseTree parsed-ows) :: (ParseTree (parsed-term x2)) :: (ParseTree parsed-ows) :: (InputChar '.') :: _::_(ParseTree (parsed-posinfo x3)) rest) = just (ParseTree (parsed-cmd (norm-cmd (DefSynth x0 x1 x2 x3))) ::' rest , 10)
len-dec-rewrite {- DefTp-} ((Id "DefTp") :: (ParseTree (parsed-posinfo x0)) :: (ParseTree (parsed-var x1)) :: (ParseTree parsed-ows) :: (InputChar '=') :: (InputChar 't') :: (InputChar 'y') :: (InputChar 'p') :: (InputChar 'e') :: (ParseTree parsed-ows) :: (ParseTree (parsed-type x2)) :: (ParseTree parsed-ows) :: (InputChar '.') :: _::_(ParseTree (parsed-posinfo x3)) rest) = just (ParseTree (parsed-cmd (norm-cmd (DefTp x0 x1 x2 x3))) ::' rest , 14)
len-dec-rewrite {- Hole-} ((Id "Hole") :: _::_(InputChar '●') rest) = just (ParseTree (parsed-term (norm-term Hole)) ::' rest , 2)
len-dec-rewrite {- Lam-} ((Id "Lam") :: (InputChar 'λ') :: (ParseTree parsed-ows) :: (ParseTree (parsed-var x0)) :: (ParseTree parsed-ows) :: (InputChar '.') :: (ParseTree parsed-ows) :: _::_(ParseTree (parsed-term x1)) rest) = just (ParseTree (parsed-term (norm-term (Lam x0 x1))) ::' rest , 8)
len-dec-rewrite {- P0-} ((Id "P0") :: _::_(InputChar 'a') rest) = just (ParseTree (parsed-varone-range-1 (string-append 0 (char-to-string 'a'))) ::' rest , 2)
len-dec-rewrite {- P1-} ((Id "P1") :: _::_(InputChar 'b') rest) = just (ParseTree (parsed-varone-range-1 (string-append 0 (char-to-string 'b'))) ::' rest , 2)
len-dec-rewrite {- P10-} ((Id "P10") :: _::_(InputChar 'k') rest) = just (ParseTree (parsed-varone-range-1 (string-append 0 (char-to-string 'k'))) ::' rest , 2)
len-dec-rewrite {- P100-} ((Id "P100") :: _::_(InputChar ' ') rest) = just (ParseTree parsed-aws-bar-21 ::' rest , 2)
len-dec-rewrite {- P101-} ((Id "P101") :: _::_(ParseTree parsed-comment) rest) = just (ParseTree parsed-aws-bar-21 ::' rest , 2)
len-dec-rewrite {- P102-} ((Id "P102") :: _::_(InputChar '\t') rest) = just (ParseTree parsed-aws-bar-22 ::' rest , 2)
len-dec-rewrite {- P103-} ((Id "P103") :: _::_(ParseTree parsed-aws-bar-21) rest) = just (ParseTree parsed-aws-bar-22 ::' rest , 2)
len-dec-rewrite {- P104-} ((Id "P104") :: _::_(InputChar '\n') rest) = just (ParseTree parsed-aws-bar-23 ::' rest , 2)
len-dec-rewrite {- P105-} ((Id "P105") :: _::_(ParseTree parsed-aws-bar-22) rest) = just (ParseTree parsed-aws-bar-23 ::' rest , 2)
len-dec-rewrite {- P106-} ((Id "P106") :: _::_(ParseTree parsed-aws-bar-23) rest) = just (ParseTree parsed-aws ::' rest , 2)
len-dec-rewrite {- P107-} ((Id "P107") :: _::_(ParseTree parsed-aws) rest) = just (ParseTree parsed-ws-plus-24 ::' rest , 2)
len-dec-rewrite {- P108-} ((Id "P108") :: (ParseTree parsed-aws) :: _::_(ParseTree parsed-ws-plus-24) rest) = just (ParseTree parsed-ws-plus-24 ::' rest , 3)
len-dec-rewrite {- P109-} ((Id "P109") :: _::_(ParseTree parsed-ws-plus-24) rest) = just (ParseTree parsed-ws ::' rest , 2)
len-dec-rewrite {- P11-} ((Id "P11") :: _::_(InputChar 'l') rest) = just (ParseTree (parsed-varone-range-1 (string-append 0 (char-to-string 'l'))) ::' rest , 2)
len-dec-rewrite {- P111-} ((Id "P111") :: (ParseTree parsed-aws) :: _::_(ParseTree parsed-ows-star-25) rest) = just (ParseTree parsed-ows-star-25 ::' rest , 3)
len-dec-rewrite {- P112-} ((Id "P112") :: _::_(ParseTree parsed-ows-star-25) rest) = just (ParseTree parsed-ows ::' rest , 2)
len-dec-rewrite {- P12-} ((Id "P12") :: _::_(InputChar 'm') rest) = just (ParseTree (parsed-varone-range-1 (string-append 0 (char-to-string 'm'))) ::' rest , 2)
len-dec-rewrite {- P13-} ((Id "P13") :: _::_(InputChar 'n') rest) = just (ParseTree (parsed-varone-range-1 (string-append 0 (char-to-string 'n'))) ::' rest , 2)
len-dec-rewrite {- P14-} ((Id "P14") :: _::_(InputChar 'o') rest) = just (ParseTree (parsed-varone-range-1 (string-append 0 (char-to-string 'o'))) ::' rest , 2)
len-dec-rewrite {- P15-} ((Id "P15") :: _::_(InputChar 'p') rest) = just (ParseTree (parsed-varone-range-1 (string-append 0 (char-to-string 'p'))) ::' rest , 2)
len-dec-rewrite {- P16-} ((Id "P16") :: _::_(InputChar 'q') rest) = just (ParseTree (parsed-varone-range-1 (string-append 0 (char-to-string 'q'))) ::' rest , 2)
len-dec-rewrite {- P17-} ((Id "P17") :: _::_(InputChar 'r') rest) = just (ParseTree (parsed-varone-range-1 (string-append 0 (char-to-string 'r'))) ::' rest , 2)
len-dec-rewrite {- P18-} ((Id "P18") :: _::_(InputChar 's') rest) = just (ParseTree (parsed-varone-range-1 (string-append 0 (char-to-string 's'))) ::' rest , 2)
len-dec-rewrite {- P19-} ((Id "P19") :: _::_(InputChar 't') rest) = just (ParseTree (parsed-varone-range-1 (string-append 0 (char-to-string 't'))) ::' rest , 2)
len-dec-rewrite {- P2-} ((Id "P2") :: _::_(InputChar 'c') rest) = just (ParseTree (parsed-varone-range-1 (string-append 0 (char-to-string 'c'))) ::' rest , 2)
len-dec-rewrite {- P20-} ((Id "P20") :: _::_(InputChar 'u') rest) = just (ParseTree (parsed-varone-range-1 (string-append 0 (char-to-string 'u'))) ::' rest , 2)
len-dec-rewrite {- P21-} ((Id "P21") :: _::_(InputChar 'v') rest) = just (ParseTree (parsed-varone-range-1 (string-append 0 (char-to-string 'v'))) ::' rest , 2)
len-dec-rewrite {- P22-} ((Id "P22") :: _::_(InputChar 'w') rest) = just (ParseTree (parsed-varone-range-1 (string-append 0 (char-to-string 'w'))) ::' rest , 2)
len-dec-rewrite {- P23-} ((Id "P23") :: _::_(InputChar 'x') rest) = just (ParseTree (parsed-varone-range-1 (string-append 0 (char-to-string 'x'))) ::' rest , 2)
len-dec-rewrite {- P24-} ((Id "P24") :: _::_(InputChar 'y') rest) = just (ParseTree (parsed-varone-range-1 (string-append 0 (char-to-string 'y'))) ::' rest , 2)
len-dec-rewrite {- P25-} ((Id "P25") :: _::_(InputChar 'z') rest) = just (ParseTree (parsed-varone-range-1 (string-append 0 (char-to-string 'z'))) ::' rest , 2)
len-dec-rewrite {- P26-} ((Id "P26") :: _::_(InputChar 'A') rest) = just (ParseTree (parsed-varone-range-2 (string-append 0 (char-to-string 'A'))) ::' rest , 2)
len-dec-rewrite {- P27-} ((Id "P27") :: _::_(InputChar 'B') rest) = just (ParseTree (parsed-varone-range-2 (string-append 0 (char-to-string 'B'))) ::' rest , 2)
len-dec-rewrite {- P28-} ((Id "P28") :: _::_(InputChar 'C') rest) = just (ParseTree (parsed-varone-range-2 (string-append 0 (char-to-string 'C'))) ::' rest , 2)
len-dec-rewrite {- P29-} ((Id "P29") :: _::_(InputChar 'D') rest) = just (ParseTree (parsed-varone-range-2 (string-append 0 (char-to-string 'D'))) ::' rest , 2)
len-dec-rewrite {- P3-} ((Id "P3") :: _::_(InputChar 'd') rest) = just (ParseTree (parsed-varone-range-1 (string-append 0 (char-to-string 'd'))) ::' rest , 2)
len-dec-rewrite {- P30-} ((Id "P30") :: _::_(InputChar 'E') rest) = just (ParseTree (parsed-varone-range-2 (string-append 0 (char-to-string 'E'))) ::' rest , 2)
len-dec-rewrite {- P31-} ((Id "P31") :: _::_(InputChar 'F') rest) = just (ParseTree (parsed-varone-range-2 (string-append 0 (char-to-string 'F'))) ::' rest , 2)
len-dec-rewrite {- P32-} ((Id "P32") :: _::_(InputChar 'G') rest) = just (ParseTree (parsed-varone-range-2 (string-append 0 (char-to-string 'G'))) ::' rest , 2)
len-dec-rewrite {- P33-} ((Id "P33") :: _::_(InputChar 'H') rest) = just (ParseTree (parsed-varone-range-2 (string-append 0 (char-to-string 'H'))) ::' rest , 2)
len-dec-rewrite {- P34-} ((Id "P34") :: _::_(InputChar 'I') rest) = just (ParseTree (parsed-varone-range-2 (string-append 0 (char-to-string 'I'))) ::' rest , 2)
len-dec-rewrite {- P35-} ((Id "P35") :: _::_(InputChar 'J') rest) = just (ParseTree (parsed-varone-range-2 (string-append 0 (char-to-string 'J'))) ::' rest , 2)
len-dec-rewrite {- P36-} ((Id "P36") :: _::_(InputChar 'K') rest) = just (ParseTree (parsed-varone-range-2 (string-append 0 (char-to-string 'K'))) ::' rest , 2)
len-dec-rewrite {- P37-} ((Id "P37") :: _::_(InputChar 'L') rest) = just (ParseTree (parsed-varone-range-2 (string-append 0 (char-to-string 'L'))) ::' rest , 2)
len-dec-rewrite {- P38-} ((Id "P38") :: _::_(InputChar 'M') rest) = just (ParseTree (parsed-varone-range-2 (string-append 0 (char-to-string 'M'))) ::' rest , 2)
len-dec-rewrite {- P39-} ((Id "P39") :: _::_(InputChar 'N') rest) = just (ParseTree (parsed-varone-range-2 (string-append 0 (char-to-string 'N'))) ::' rest , 2)
len-dec-rewrite {- P4-} ((Id "P4") :: _::_(InputChar 'e') rest) = just (ParseTree (parsed-varone-range-1 (string-append 0 (char-to-string 'e'))) ::' rest , 2)
len-dec-rewrite {- P40-} ((Id "P40") :: _::_(InputChar 'O') rest) = just (ParseTree (parsed-varone-range-2 (string-append 0 (char-to-string 'O'))) ::' rest , 2)
len-dec-rewrite {- P41-} ((Id "P41") :: _::_(InputChar 'P') rest) = just (ParseTree (parsed-varone-range-2 (string-append 0 (char-to-string 'P'))) ::' rest , 2)
len-dec-rewrite {- P42-} ((Id "P42") :: _::_(InputChar 'Q') rest) = just (ParseTree (parsed-varone-range-2 (string-append 0 (char-to-string 'Q'))) ::' rest , 2)
len-dec-rewrite {- P43-} ((Id "P43") :: _::_(InputChar 'R') rest) = just (ParseTree (parsed-varone-range-2 (string-append 0 (char-to-string 'R'))) ::' rest , 2)
len-dec-rewrite {- P44-} ((Id "P44") :: _::_(InputChar 'S') rest) = just (ParseTree (parsed-varone-range-2 (string-append 0 (char-to-string 'S'))) ::' rest , 2)
len-dec-rewrite {- P45-} ((Id "P45") :: _::_(InputChar 'T') rest) = just (ParseTree (parsed-varone-range-2 (string-append 0 (char-to-string 'T'))) ::' rest , 2)
len-dec-rewrite {- P46-} ((Id "P46") :: _::_(InputChar 'U') rest) = just (ParseTree (parsed-varone-range-2 (string-append 0 (char-to-string 'U'))) ::' rest , 2)
len-dec-rewrite {- P47-} ((Id "P47") :: _::_(InputChar 'V') rest) = just (ParseTree (parsed-varone-range-2 (string-append 0 (char-to-string 'V'))) ::' rest , 2)
len-dec-rewrite {- P48-} ((Id "P48") :: _::_(InputChar 'W') rest) = just (ParseTree (parsed-varone-range-2 (string-append 0 (char-to-string 'W'))) ::' rest , 2)
len-dec-rewrite {- P49-} ((Id "P49") :: _::_(InputChar 'X') rest) = just (ParseTree (parsed-varone-range-2 (string-append 0 (char-to-string 'X'))) ::' rest , 2)
len-dec-rewrite {- P5-} ((Id "P5") :: _::_(InputChar 'f') rest) = just (ParseTree (parsed-varone-range-1 (string-append 0 (char-to-string 'f'))) ::' rest , 2)
len-dec-rewrite {- P50-} ((Id "P50") :: _::_(InputChar 'Y') rest) = just (ParseTree (parsed-varone-range-2 (string-append 0 (char-to-string 'Y'))) ::' rest , 2)
len-dec-rewrite {- P51-} ((Id "P51") :: _::_(InputChar 'Z') rest) = just (ParseTree (parsed-varone-range-2 (string-append 0 (char-to-string 'Z'))) ::' rest , 2)
len-dec-rewrite {- P52-} ((Id "P52") :: _::_(InputChar '0') rest) = just (ParseTree (parsed-varone-range-3 (string-append 0 (char-to-string '0'))) ::' rest , 2)
len-dec-rewrite {- P53-} ((Id "P53") :: _::_(InputChar '1') rest) = just (ParseTree (parsed-varone-range-3 (string-append 0 (char-to-string '1'))) ::' rest , 2)
len-dec-rewrite {- P54-} ((Id "P54") :: _::_(InputChar '2') rest) = just (ParseTree (parsed-varone-range-3 (string-append 0 (char-to-string '2'))) ::' rest , 2)
len-dec-rewrite {- P55-} ((Id "P55") :: _::_(InputChar '3') rest) = just (ParseTree (parsed-varone-range-3 (string-append 0 (char-to-string '3'))) ::' rest , 2)
len-dec-rewrite {- P56-} ((Id "P56") :: _::_(InputChar '4') rest) = just (ParseTree (parsed-varone-range-3 (string-append 0 (char-to-string '4'))) ::' rest , 2)
len-dec-rewrite {- P57-} ((Id "P57") :: _::_(InputChar '5') rest) = just (ParseTree (parsed-varone-range-3 (string-append 0 (char-to-string '5'))) ::' rest , 2)
len-dec-rewrite {- P58-} ((Id "P58") :: _::_(InputChar '6') rest) = just (ParseTree (parsed-varone-range-3 (string-append 0 (char-to-string '6'))) ::' rest , 2)
len-dec-rewrite {- P59-} ((Id "P59") :: _::_(InputChar '7') rest) = just (ParseTree (parsed-varone-range-3 (string-append 0 (char-to-string '7'))) ::' rest , 2)
len-dec-rewrite {- P6-} ((Id "P6") :: _::_(InputChar 'g') rest) = just (ParseTree (parsed-varone-range-1 (string-append 0 (char-to-string 'g'))) ::' rest , 2)
len-dec-rewrite {- P60-} ((Id "P60") :: _::_(InputChar '8') rest) = just (ParseTree (parsed-varone-range-3 (string-append 0 (char-to-string '8'))) ::' rest , 2)
len-dec-rewrite {- P61-} ((Id "P61") :: _::_(InputChar '9') rest) = just (ParseTree (parsed-varone-range-3 (string-append 0 (char-to-string '9'))) ::' rest , 2)
len-dec-rewrite {- P62-} ((Id "P62") :: _::_(InputChar '-') rest) = just (ParseTree (parsed-varone-bar-4 (string-append 0 (char-to-string '-'))) ::' rest , 2)
len-dec-rewrite {- P63-} ((Id "P63") :: _::_(ParseTree (parsed-varone-range-3 x0)) rest) = just (ParseTree (parsed-varone-bar-4 (string-append 0 x0)) ::' rest , 2)
len-dec-rewrite {- P64-} ((Id "P64") :: _::_(InputChar '\'') rest) = just (ParseTree (parsed-varone-bar-5 (string-append 0 (char-to-string '\''))) ::' rest , 2)
len-dec-rewrite {- P65-} ((Id "P65") :: _::_(ParseTree (parsed-varone-bar-4 x0)) rest) = just (ParseTree (parsed-varone-bar-5 (string-append 0 x0)) ::' rest , 2)
len-dec-rewrite {- P66-} ((Id "P66") :: _::_(ParseTree (parsed-varone-range-2 x0)) rest) = just (ParseTree (parsed-varone-bar-6 (string-append 0 x0)) ::' rest , 2)
len-dec-rewrite {- P67-} ((Id "P67") :: _::_(ParseTree (parsed-varone-bar-5 x0)) rest) = just (ParseTree (parsed-varone-bar-6 (string-append 0 x0)) ::' rest , 2)
len-dec-rewrite {- P68-} ((Id "P68") :: _::_(ParseTree (parsed-varone-range-1 x0)) rest) = just (ParseTree (parsed-varone-bar-7 (string-append 0 x0)) ::' rest , 2)
len-dec-rewrite {- P69-} ((Id "P69") :: _::_(ParseTree (parsed-varone-bar-6 x0)) rest) = just (ParseTree (parsed-varone-bar-7 (string-append 0 x0)) ::' rest , 2)
len-dec-rewrite {- P7-} ((Id "P7") :: _::_(InputChar 'h') rest) = just (ParseTree (parsed-varone-range-1 (string-append 0 (char-to-string 'h'))) ::' rest , 2)
len-dec-rewrite {- P70-} ((Id "P70") :: _::_(ParseTree (parsed-varone-bar-7 x0)) rest) = just (ParseTree (parsed-varone (string-append 0 x0)) ::' rest , 2)
len-dec-rewrite {- P71-} ((Id "P71") :: _::_(ParseTree (parsed-varone x0)) rest) = just (ParseTree (parsed-var-plus-8 (string-append 0 x0)) ::' rest , 2)
len-dec-rewrite {- P72-} ((Id "P72") :: (ParseTree (parsed-varone x0)) :: _::_(ParseTree (parsed-var-plus-8 x1)) rest) = just (ParseTree (parsed-var-plus-8 (string-append 1 x0 x1)) ::' rest , 3)
len-dec-rewrite {- P73-} ((Id "P73") :: _::_(ParseTree (parsed-var-plus-8 x0)) rest) = just (ParseTree (parsed-var (string-append 0 x0)) ::' rest , 2)
len-dec-rewrite {- P74-} ((Id "P74") :: _::_(InputChar ')') rest) = just (ParseTree parsed-anychar-bar-9 ::' rest , 2)
len-dec-rewrite {- P75-} ((Id "P75") :: _::_(InputChar '●') rest) = just (ParseTree parsed-anychar-bar-9 ::' rest , 2)
len-dec-rewrite {- P76-} ((Id "P76") :: _::_(InputChar '(') rest) = just (ParseTree parsed-anychar-bar-10 ::' rest , 2)
len-dec-rewrite {- P77-} ((Id "P77") :: _::_(ParseTree parsed-anychar-bar-9) rest) = just (ParseTree parsed-anychar-bar-10 ::' rest , 2)
len-dec-rewrite {- P78-} ((Id "P78") :: _::_(InputChar '.') rest) = just (ParseTree parsed-anychar-bar-11 ::' rest , 2)
len-dec-rewrite {- P79-} ((Id "P79") :: _::_(ParseTree parsed-anychar-bar-10) rest) = just (ParseTree parsed-anychar-bar-11 ::' rest , 2)
len-dec-rewrite {- P8-} ((Id "P8") :: _::_(InputChar 'i') rest) = just (ParseTree (parsed-varone-range-1 (string-append 0 (char-to-string 'i'))) ::' rest , 2)
len-dec-rewrite {- P80-} ((Id "P80") :: _::_(InputChar ':') rest) = just (ParseTree parsed-anychar-bar-12 ::' rest , 2)
len-dec-rewrite {- P81-} ((Id "P81") :: _::_(ParseTree parsed-anychar-bar-11) rest) = just (ParseTree parsed-anychar-bar-12 ::' rest , 2)
len-dec-rewrite {- P82-} ((Id "P82") :: _::_(InputChar '→') rest) = just (ParseTree parsed-anychar-bar-13 ::' rest , 2)
len-dec-rewrite {- P83-} ((Id "P83") :: _::_(ParseTree parsed-anychar-bar-12) rest) = just (ParseTree parsed-anychar-bar-13 ::' rest , 2)
len-dec-rewrite {- P84-} ((Id "P84") :: _::_(InputChar 'λ') rest) = just (ParseTree parsed-anychar-bar-14 ::' rest , 2)
len-dec-rewrite {- P85-} ((Id "P85") :: _::_(ParseTree parsed-anychar-bar-13) rest) = just (ParseTree parsed-anychar-bar-14 ::' rest , 2)
len-dec-rewrite {- P86-} ((Id "P86") :: _::_(InputChar '∷') rest) = just (ParseTree parsed-anychar-bar-15 ::' rest , 2)
len-dec-rewrite {- P87-} ((Id "P87") :: _::_(ParseTree parsed-anychar-bar-14) rest) = just (ParseTree parsed-anychar-bar-15 ::' rest , 2)
len-dec-rewrite {- P88-} ((Id "P88") :: _::_(InputChar '%') rest) = just (ParseTree parsed-anychar-bar-16 ::' rest , 2)
len-dec-rewrite {- P89-} ((Id "P89") :: _::_(ParseTree parsed-anychar-bar-15) rest) = just (ParseTree parsed-anychar-bar-16 ::' rest , 2)
len-dec-rewrite {- P9-} ((Id "P9") :: _::_(InputChar 'j') rest) = just (ParseTree (parsed-varone-range-1 (string-append 0 (char-to-string 'j'))) ::' rest , 2)
len-dec-rewrite {- P90-} ((Id "P90") :: _::_(InputChar ' ') rest) = just (ParseTree parsed-anychar-bar-17 ::' rest , 2)
len-dec-rewrite {- P91-} ((Id "P91") :: _::_(ParseTree parsed-anychar-bar-16) rest) = just (ParseTree parsed-anychar-bar-17 ::' rest , 2)
len-dec-rewrite {- P92-} ((Id "P92") :: _::_(InputChar '\t') rest) = just (ParseTree parsed-anychar-bar-18 ::' rest , 2)
len-dec-rewrite {- P93-} ((Id "P93") :: _::_(ParseTree parsed-anychar-bar-17) rest) = just (ParseTree parsed-anychar-bar-18 ::' rest , 2)
len-dec-rewrite {- P94-} ((Id "P94") :: _::_(ParseTree (parsed-varone x0)) rest) = just (ParseTree parsed-anychar-bar-19 ::' rest , 2)
len-dec-rewrite {- P95-} ((Id "P95") :: _::_(ParseTree parsed-anychar-bar-18) rest) = just (ParseTree parsed-anychar-bar-19 ::' rest , 2)
len-dec-rewrite {- P96-} ((Id "P96") :: _::_(ParseTree parsed-anychar-bar-19) rest) = just (ParseTree parsed-anychar ::' rest , 2)
len-dec-rewrite {- P98-} ((Id "P98") :: (ParseTree parsed-anychar) :: _::_(ParseTree parsed-comment-star-20) rest) = just (ParseTree parsed-comment-star-20 ::' rest , 3)
len-dec-rewrite {- P99-} ((Id "P99") :: (InputChar '%') :: (ParseTree parsed-comment-star-20) :: _::_(InputChar '\n') rest) = just (ParseTree parsed-comment ::' rest , 4)
len-dec-rewrite {- Paren-} ((Id "Paren") :: (InputChar '(') :: (ParseTree parsed-ows) :: (ParseTree (parsed-term x0)) :: (ParseTree parsed-ows) :: _::_(InputChar ')') rest) = just (ParseTree (parsed-term (norm-term (Paren x0))) ::' rest , 6)
len-dec-rewrite {- TpParens-} ((Id "TpParens") :: (InputChar '(') :: (ParseTree parsed-ows) :: (ParseTree (parsed-type x0)) :: (ParseTree parsed-ows) :: _::_(InputChar ')') rest) = just (ParseTree (parsed-type (norm-type (TpParens x0))) ::' rest , 6)
len-dec-rewrite {- TpVar-} ((Id "TpVar") :: _::_(ParseTree (parsed-var x0)) rest) = just (ParseTree (parsed-type (norm-type (TpVar x0))) ::' rest , 2)
len-dec-rewrite {- Var-} ((Id "Var") :: _::_(ParseTree (parsed-var x0)) rest) = just (ParseTree (parsed-term (norm-term (Var x0))) ::' rest , 2)
len-dec-rewrite {- P110-} (_::_(Id "P110") rest) = just (ParseTree parsed-ows-star-25 ::' rest , 1)
len-dec-rewrite {- P97-} (_::_(Id "P97") rest) = just (ParseTree parsed-comment-star-20 ::' rest , 1)
len-dec-rewrite {- Posinfo-} (_::_(Posinfo n) rest) = just (ParseTree (parsed-posinfo (ℕ-to-string n)) ::' rest , 1)
len-dec-rewrite x = nothing

rrs : rewriteRules
rrs = record { len-dec-rewrite = len-dec-rewrite }
