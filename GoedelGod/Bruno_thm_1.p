%----Axioms for Quantified Modal Logic S5 (providing quantification over 
%----individuals, propositions, sets of individuals, sets of sets of individual).

include('Quantified_S5.ax').

%------------------------------------------------------------------------------

% thf(god_tp,type,(god: mu > $i > $o)).
thf(pos_prop_tp,type,(pos_prop: (mu > $i > $o) > $i > $o )).
   
%----Axiom 1
thf(ax1,axiom,
    ( mvalid @
          ( mforall_indset
          @ ^ [Phi: mu > $i > $o] :
              ( mforall_indset
              @ ^ [Psi: mu > $i > $o] :
                  ( mimplies
                  @ ( mand @ ( pos_prop @ Phi )
                    @ ( mbox_s5
                      @ ( mforall_ind
                        @ ^ [X: mu] :
                            ( mimplies @ ( Phi @ X ) @ ( Psi @ X ) ) ) ) )
                  @ ( pos_prop @ Psi ) ) ) ) ) ).

%----Axiom 2
thf(ax2,axiom,
    ( mvalid @
          ( mforall_indset
          @ ^ [Phi: mu > $i > $o] :
              ( mequiv
              @ ( pos_prop
                @ ^ [W: mu] :
                    ( mnot @ ( Phi @ W ) ) )
              @ ( mnot @ ( pos_prop @ Phi ) ) ) ) ) ).

   
%----Conjecture 
thf(thm,conjecture,
    ( mvalid @
          ( mforall_indset
          @ ^ [Phi: mu > $i > $o] :
              ( mimplies @ ( pos_prop @ Phi )
              @ ( mdia_s5
                @ ( mexists_ind
                  @ ^ [X: mu] :
                      ( Phi @ X ) ) ) ) ) ) ).
