(************************************************************************)
(*  v      *   The Coq Proof Assistant  /  The Coq Development Team     *)
(* <O___,, *   INRIA - CNRS - LIX - LRI - PPS - Copyright 1999-2012     *)
(*   \VV/  **************************************************************)
(*    //   *      This file is distributed under the terms of the       *)
(*         *       GNU Lesser General Public License Version 2.1        *)
(************************************************************************)

open Names
open Locus

(** Utilities on occurrences *)

val occurrences_map :
  ('a list -> 'b list) -> 'a occurrences_gen -> 'b occurrences_gen

(** From occurrences to a list of positions (or complement of positions) *)
val convert_occs : occurrences -> bool * int list

val is_selected : int -> occurrences -> bool

(** Usual clauses *)

val allHypsAndConcl : 'a clause_expr
val allHyps : 'a clause_expr
val onConcl : 'a clause_expr
val nowhere : 'a clause_expr
val onHyp : 'a -> 'a clause_expr

(** Tests *)

val is_nowhere : 'a clause_expr -> bool

(** Clause conversion functions, parametrized by a hyp enumeration function *)

val simple_clause_of : (unit -> Id.t list) -> clause -> simple_clause
val concrete_clause_of : (unit -> Id.t list) -> clause -> concrete_clause

(** Miscellaneous functions *)

val occurrences_of_hyp : Id.t -> clause or_like_first ->
  (occurrences * hyp_location_flag) or_like_first
val occurrences_of_goal : clause or_like_first -> occurrences or_like_first
val in_every_hyp : clause or_like_first -> bool
