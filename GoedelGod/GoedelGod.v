(* Author: Bruno Woltzenlogel Paleo (bruno@logic.at) *)

(* Formalization of Goedels Ontological Proof of Gods Existence *)

Require Import Coq.Logic.Classical.
Require Import Coq.Logic.Classical_Pred_Type.
Require Import Setoid.

(* Type for individuals and objects in the world *)
Parameter i: Type.

(* Constant predicate that distinguishes positive properties *)
Parameter Positive: (i -> Prop) -> Prop.

(* Constant for the modal operator for `necessarily` *)
Parameter box: Prop -> Prop.

(* Constant for the modal operator for `possibly` *)
Definition diamond (p: Prop) := not (box(not p)).

(* Modal logic axioms *)
Axiom K: forall p: Prop, p -> (box p).
Axiom M: forall p: Prop, (box p) -> p.

(* Axiom 1: properties necessarily entailed by positive properties are also positive *)
Axiom axiom1: forall p q: i -> Prop, Positive p /\ (box (forall x,(p x) -> (q x))) -> Positive q.

(* Axiom 2: the negation of a property is positive iff the property is not positive *)
Axiom axiom2 : forall p: i -> Prop, Positive (fun x => not (p(x))) <-> not (Positive p).

(* Theorem 1: positive properties possibly have a witness *)
Theorem theorem1: forall p: i -> Prop, (Positive p) -> diamond (exists x, p x ).
Proof.
intro p.
intro Positive_p.
unfold diamond.
intro B.
absurd (Positive p).
  apply axiom2.
  apply axiom1 with (p := p).
  split.
    exact Positive_p.
  
    apply K.
    intro x.
    intro px.
    apply M in B.
    apply not_ex_all_not with (n := x) in B.
    exact B.
  exact Positive_p.
Qed.



