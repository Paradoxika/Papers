%----Axioms for Quantified Modal Logic S5 (providing quantification over 
%----individuals, propositions, sets of individuals, sets of sets of individual).

include('Quantified_S5.ax').

%------------------------------------------------------------------------------

thf(god_tp,type,(
    god: mu > $i > $o )).

thf(pos_prop_tp,type,(
    pos_prop: ( mu > $i > $o ) > $i > $o )).

thf(ess_tp,type,(
    ess: ( mu > $i > $o ) > mu > $i > $o )).

thf(ess_def,definition,
    ( ess
    = ( ^ [Phi: mu > $i > $o,X: mu] :
          ( mand @ ( Phi @ X )
          @ ( mforall_indset
            @ ^ [Psi: mu > $i > $o] :
                ( mimplies @ ( Psi @ X )
                @ ( mbox_s5
                  @ ( mforall_ind
                    @ ^ [Z: mu] :
                        ( mimplies @ ( Phi @ Z ) @ ( Psi @ Z ) ) ) ) ) ) ) ) )).

%----Axiom 4
thf(ax4,axiom,
    ( mvalid
    @ ( mforall_indset
      @ ^ [Phi: mu > $i > $o] :
          ( mimplies @ ( pos_prop @ Phi ) @ ( mbox_s5 @ ( pos_prop @ Phi ) ) ) ) )).

%----Theorem 3
thf(thm3,conjecture,
    ( mvalid
    @ ( mforall_ind
      @ ^ [Y: mu] :
          ( mimplies @ ( god @ Y ) @ ( ess @ god @ Y ) ) ) )).


