(* Author: Bruno Woltzenlogel Paleo (bruno@logic.at) *)

(* Formalization of Goedels Ontological Proof of Gods Existence *)

Require Import Coq.Logic.Classical.
Require Import Coq.Logic.Classical_Pred_Type.


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


(* Definition of God *)
Definition G(x: i) := forall p, ((Positive p) -> (p x)).

(* Axiom 3: Being God is a positive property *)
Axiom axiom3: (Positive G).

(* Theorem 2: it is possible that God exists *)
Theorem theorem2: diamond (exists x, (G x)). 
Proof.
apply theorem1.
apply axiom3.
Qed.


(* Definition of essentiality *)
Definition Essential(p: i-> Prop)(x: i) := (p x) /\ forall q: (i -> Prop),((q x) -> box (forall y,((p y) -> (q y)))).

(* Axiom 4: positive properties are necessarily positive *)
Axiom axiom4: forall p, (Positive p) -> box (Positive p).

(* Theorem 3: if an individual is a God, then being God is an essential property for that individual *)
Theorem theorem3: forall y, (G y) -> (Essential G y).
Proof.
intro y.
intro Gy.
unfold Essential.
split.
  exact Gy.

  intro q.
  intro qy.
  cut (box (Positive q)).
    intro bPq.
    apply K.
    cut (Positive q).
      intro Pq.
      intro y0.
      intro Gy0.
      cut (Positive q).
        unfold G in Gy0.
        apply Gy0.

        exact Pq.
     
      apply M.
      exact bPq.

  cut (q y).
    intro q_y.
    cut (Positive q).
      apply axiom4.

      cut (q y).
        intro q__y.
        apply NNPP.
        intro not_Pos_q.
        absurd (q y).
          cut (Positive (fun x => not (q x))).
            unfold G in Gy.
            apply Gy.

            cut (not (Positive q)).
              apply axiom2.

              exact not_Pos_q.

          exact q__y.

        exact q_y.

    exact qy.
Qed.


(* Definition of necessary existence *)
Definition NecExists(x: i) := forall p, (Essential p x) -> box (exists y, (p y)).

(* Axiom 5: necessry existence is a positive property *)
Axiom axiom5: (Positive NecExists).


Lemma lemma1: (exists z, (G z)) -> box (exists x, (G x)).
Proof.
intro E.
destruct E as [g Gg].
cut (Essential G g).
  cut (NecExists g).
    intro NEg.
    unfold NecExists in NEg.
    apply NEg.

    cut (Positive NecExists).
      unfold G in Gg.
      apply Gg.

      apply axiom5.

  cut (G g).
    apply theorem3.

    exact Gg.
Qed.

(* Axiom for modal logic S5 *)
Axiom S5: forall p, (diamond p) -> box (diamond p).

(* In modal logic S5, iterations of modal operators can be collapsed *)
Theorem modal_iteration_S5: forall p, (diamond (box p)) -> (box p).
Proof.
Admitted. (* ToDo *)

Lemma lemma2: forall p q: Prop, (diamond p) -> (box (p -> q)) -> (diamond q).
Proof.
intro.
intro.
intro Dp.
intro Bpq.
unfold diamond.
intro Bnq.
absurd q.
  apply M.
  exact Bnq.

  apply M in Bpq.
  apply Bpq.
  apply imply_to_or in Bpq.
  destruct Bpq as [H1|H2].
    unfold diamond in Dp.
    apply K in H1.
    absurd (box (not p)).
      exact Dp.
      exact H1.

      apply M in Bnq.
      exfalso.
      contradiction.
Qed.
(* ToDo: it might be possible to simplify the proof above *)


(* Theorem 4: the existence of a God is necessary *)
Theorem theorem4: box (exists x, G x).
Proof.
cut (diamond (box (exists x, G x))).
  apply modal_iteration_S5.
  cut (diamond (exists x, G x)).
    intro th2.
    apply lemma2 with (p := exists z, G z).
    exact th2.
   
    apply K.
    apply lemma1.

  apply theorem2.
Qed.


(* Theorem 5: There exists a god *)
Theorem God_exists: exists x, (G x).
Proof.
apply M.
apply theorem4.
Qed.

