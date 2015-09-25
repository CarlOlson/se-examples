----------------------------------------------------------------------------------
-- Types for parse trees
----------------------------------------------------------------------------------

module stlc-types where

open import lib
open import parse-tree

posinfo = string
var = string
var-plus-8 = string
varone = string
varone-bar-4 = string
varone-bar-5 = string
varone-bar-6 = string
varone-bar-7 = string
varone-range-1 = string
varone-range-2 = string
varone-range-3 = string

mutual

  data cmd : Set where 
    DefCheck : posinfo → var → term → type → posinfo → cmd
    DefSynth : posinfo → var → term → posinfo → cmd
    DefTp : posinfo → var → type → posinfo → cmd

  data cmds : Set where 
    CmdsNext : cmd → cmds → cmds
    CmdsStart : cmd → cmds

  data start : Set where 
    Cmds : cmds → start

  data term : Set where 
    App : term → term → term
    Ascribe : term → type → term
    Hole : posinfo → posinfo → term
    Lam : var → term → term
    Paren : term → term
    Var : var → term

  data type : Set where 
    Arrow : type → type → type
    TpParens : type → type
    TpVar : var → type

-- embedded types:

data ParseTreeT : Set where
  parsed-cmd : cmd → ParseTreeT
  parsed-cmds : cmds → ParseTreeT
  parsed-start : start → ParseTreeT
  parsed-term : term → ParseTreeT
  parsed-type : type → ParseTreeT
  parsed-posinfo : posinfo → ParseTreeT
  parsed-var : var → ParseTreeT
  parsed-var-plus-8 : var-plus-8 → ParseTreeT
  parsed-varone : varone → ParseTreeT
  parsed-varone-bar-4 : varone-bar-4 → ParseTreeT
  parsed-varone-bar-5 : varone-bar-5 → ParseTreeT
  parsed-varone-bar-6 : varone-bar-6 → ParseTreeT
  parsed-varone-bar-7 : varone-bar-7 → ParseTreeT
  parsed-varone-range-1 : varone-range-1 → ParseTreeT
  parsed-varone-range-2 : varone-range-2 → ParseTreeT
  parsed-varone-range-3 : varone-range-3 → ParseTreeT
  parsed-anychar : ParseTreeT
  parsed-anychar-bar-10 : ParseTreeT
  parsed-anychar-bar-11 : ParseTreeT
  parsed-anychar-bar-12 : ParseTreeT
  parsed-anychar-bar-13 : ParseTreeT
  parsed-anychar-bar-14 : ParseTreeT
  parsed-anychar-bar-15 : ParseTreeT
  parsed-anychar-bar-16 : ParseTreeT
  parsed-anychar-bar-17 : ParseTreeT
  parsed-anychar-bar-18 : ParseTreeT
  parsed-anychar-bar-19 : ParseTreeT
  parsed-anychar-bar-20 : ParseTreeT
  parsed-anychar-bar-21 : ParseTreeT
  parsed-anychar-bar-9 : ParseTreeT
  parsed-aws : ParseTreeT
  parsed-aws-bar-23 : ParseTreeT
  parsed-aws-bar-24 : ParseTreeT
  parsed-aws-bar-25 : ParseTreeT
  parsed-comment : ParseTreeT
  parsed-comment-star-22 : ParseTreeT
  parsed-ows : ParseTreeT
  parsed-ows-star-27 : ParseTreeT
  parsed-ws : ParseTreeT
  parsed-ws-plus-26 : ParseTreeT

------------------------------------------
-- Parse tree printing functions
------------------------------------------

posinfoToString : posinfo → string
posinfoToString x = "(posinfo " ^ x ^ ")"
varToString : var → string
varToString x = "(var " ^ x ^ ")"
var-plus-8ToString : var-plus-8 → string
var-plus-8ToString x = "(var-plus-8 " ^ x ^ ")"
varoneToString : varone → string
varoneToString x = "(varone " ^ x ^ ")"
varone-bar-4ToString : varone-bar-4 → string
varone-bar-4ToString x = "(varone-bar-4 " ^ x ^ ")"
varone-bar-5ToString : varone-bar-5 → string
varone-bar-5ToString x = "(varone-bar-5 " ^ x ^ ")"
varone-bar-6ToString : varone-bar-6 → string
varone-bar-6ToString x = "(varone-bar-6 " ^ x ^ ")"
varone-bar-7ToString : varone-bar-7 → string
varone-bar-7ToString x = "(varone-bar-7 " ^ x ^ ")"
varone-range-1ToString : varone-range-1 → string
varone-range-1ToString x = "(varone-range-1 " ^ x ^ ")"
varone-range-2ToString : varone-range-2 → string
varone-range-2ToString x = "(varone-range-2 " ^ x ^ ")"
varone-range-3ToString : varone-range-3 → string
varone-range-3ToString x = "(varone-range-3 " ^ x ^ ")"

mutual
  cmdToString : cmd → string
  cmdToString (DefCheck x0 x1 x2 x3 x4) = "(DefCheck" ^ " " ^ (posinfoToString x0) ^ " " ^ (varToString x1) ^ " " ^ (termToString x2) ^ " " ^ (typeToString x3) ^ " " ^ (posinfoToString x4) ^ ")"
  cmdToString (DefSynth x0 x1 x2 x3) = "(DefSynth" ^ " " ^ (posinfoToString x0) ^ " " ^ (varToString x1) ^ " " ^ (termToString x2) ^ " " ^ (posinfoToString x3) ^ ")"
  cmdToString (DefTp x0 x1 x2 x3) = "(DefTp" ^ " " ^ (posinfoToString x0) ^ " " ^ (varToString x1) ^ " " ^ (typeToString x2) ^ " " ^ (posinfoToString x3) ^ ")"

  cmdsToString : cmds → string
  cmdsToString (CmdsNext x0 x1) = "(CmdsNext" ^ " " ^ (cmdToString x0) ^ " " ^ (cmdsToString x1) ^ ")"
  cmdsToString (CmdsStart x0) = "(CmdsStart" ^ " " ^ (cmdToString x0) ^ ")"

  startToString : start → string
  startToString (Cmds x0) = "(Cmds" ^ " " ^ (cmdsToString x0) ^ ")"

  termToString : term → string
  termToString (App x0 x1) = "(App" ^ " " ^ (termToString x0) ^ " " ^ (termToString x1) ^ ")"
  termToString (Ascribe x0 x1) = "(Ascribe" ^ " " ^ (termToString x0) ^ " " ^ (typeToString x1) ^ ")"
  termToString (Hole x0 x1) = "(Hole" ^ " " ^ (posinfoToString x0) ^ " " ^ (posinfoToString x1) ^ ")"
  termToString (Lam x0 x1) = "(Lam" ^ " " ^ (varToString x0) ^ " " ^ (termToString x1) ^ ")"
  termToString (Paren x0) = "(Paren" ^ " " ^ (termToString x0) ^ ")"
  termToString (Var x0) = "(Var" ^ " " ^ (varToString x0) ^ ")"

  typeToString : type → string
  typeToString (Arrow x0 x1) = "(Arrow" ^ " " ^ (typeToString x0) ^ " " ^ (typeToString x1) ^ ")"
  typeToString (TpParens x0) = "(TpParens" ^ " " ^ (typeToString x0) ^ ")"
  typeToString (TpVar x0) = "(TpVar" ^ " " ^ (varToString x0) ^ ")"

ParseTreeToString : ParseTreeT → string
ParseTreeToString (parsed-cmd t) = cmdToString t
ParseTreeToString (parsed-cmds t) = cmdsToString t
ParseTreeToString (parsed-start t) = startToString t
ParseTreeToString (parsed-term t) = termToString t
ParseTreeToString (parsed-type t) = typeToString t
ParseTreeToString (parsed-posinfo t) = posinfoToString t
ParseTreeToString (parsed-var t) = varToString t
ParseTreeToString (parsed-var-plus-8 t) = var-plus-8ToString t
ParseTreeToString (parsed-varone t) = varoneToString t
ParseTreeToString (parsed-varone-bar-4 t) = varone-bar-4ToString t
ParseTreeToString (parsed-varone-bar-5 t) = varone-bar-5ToString t
ParseTreeToString (parsed-varone-bar-6 t) = varone-bar-6ToString t
ParseTreeToString (parsed-varone-bar-7 t) = varone-bar-7ToString t
ParseTreeToString (parsed-varone-range-1 t) = varone-range-1ToString t
ParseTreeToString (parsed-varone-range-2 t) = varone-range-2ToString t
ParseTreeToString (parsed-varone-range-3 t) = varone-range-3ToString t
ParseTreeToString parsed-anychar = "[anychar]"
ParseTreeToString parsed-anychar-bar-10 = "[anychar-bar-10]"
ParseTreeToString parsed-anychar-bar-11 = "[anychar-bar-11]"
ParseTreeToString parsed-anychar-bar-12 = "[anychar-bar-12]"
ParseTreeToString parsed-anychar-bar-13 = "[anychar-bar-13]"
ParseTreeToString parsed-anychar-bar-14 = "[anychar-bar-14]"
ParseTreeToString parsed-anychar-bar-15 = "[anychar-bar-15]"
ParseTreeToString parsed-anychar-bar-16 = "[anychar-bar-16]"
ParseTreeToString parsed-anychar-bar-17 = "[anychar-bar-17]"
ParseTreeToString parsed-anychar-bar-18 = "[anychar-bar-18]"
ParseTreeToString parsed-anychar-bar-19 = "[anychar-bar-19]"
ParseTreeToString parsed-anychar-bar-20 = "[anychar-bar-20]"
ParseTreeToString parsed-anychar-bar-21 = "[anychar-bar-21]"
ParseTreeToString parsed-anychar-bar-9 = "[anychar-bar-9]"
ParseTreeToString parsed-aws = "[aws]"
ParseTreeToString parsed-aws-bar-23 = "[aws-bar-23]"
ParseTreeToString parsed-aws-bar-24 = "[aws-bar-24]"
ParseTreeToString parsed-aws-bar-25 = "[aws-bar-25]"
ParseTreeToString parsed-comment = "[comment]"
ParseTreeToString parsed-comment-star-22 = "[comment-star-22]"
ParseTreeToString parsed-ows = "[ows]"
ParseTreeToString parsed-ows-star-27 = "[ows-star-27]"
ParseTreeToString parsed-ws = "[ws]"
ParseTreeToString parsed-ws-plus-26 = "[ws-plus-26]"

------------------------------------------
-- Reorganizing rules
------------------------------------------

mutual

  {-# NO_TERMINATION_CHECK #-}
  norm-type : (x : type) → type
  norm-type (Arrow (Arrow x1 x2) x3) = (norm-type (Arrow  x1 (norm-type (Arrow  x2 x3) )) )
  norm-type x = x

  {-# NO_TERMINATION_CHECK #-}
  norm-term : (x : term) → term
  norm-term (App (App x1 (Lam x2 x3)) x4) = (norm-term (App  x1 (norm-term (Lam  x2 (norm-term (App  x3 x4) )) )) )
  norm-term (App (Lam x1 x2) x3) = (norm-term (Lam  x1 (norm-term (App  x2 x3) )) )
  norm-term (App x1 (App x2 x3)) = (norm-term (App  (norm-term (App  x1 x2) ) x3) )
  norm-term x = x

  {-# NO_TERMINATION_CHECK #-}
  norm-start : (x : start) → start
  norm-start x = x

  {-# NO_TERMINATION_CHECK #-}
  norm-posinfo : (x : posinfo) → posinfo
  norm-posinfo x = x

  {-# NO_TERMINATION_CHECK #-}
  norm-cmds : (x : cmds) → cmds
  norm-cmds x = x

  {-# NO_TERMINATION_CHECK #-}
  norm-cmd : (x : cmd) → cmd
  norm-cmd x = x

isParseTree : ParseTreeT → 𝕃 char → string → Set
isParseTree p l s = ⊤ {- this will be ignored since we are using simply typed runs -}

ptr : ParseTreeRec
ptr = record { ParseTreeT = ParseTreeT ; isParseTree = isParseTree ; ParseTreeToString = ParseTreeToString }

