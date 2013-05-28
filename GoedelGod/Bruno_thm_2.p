%----Axioms for Quantified Modal Logic S5 (providing quantification over 
%----individuals, propositions, sets of individuals, sets of sets of individual).

include('Quantified_S5.ax').

%------------------------------------------------------------------------------

thf(god_tp,type,(god: mu > $i > $o)).
thf(pos_prop_tp,type,(pos_prop: (mu > $i > $o) > $i > $o )).

   
%----Assuming Theorem 1 (proved before) 
thf(thm1,axiom,
    ( mvalid
    @ ( mforall_indset
          @ ^ [Phi: mu > $i > $o] :
              ( mimplies @ ( pos_prop @ Phi )
              @ ( mdia_s5
                @ ( mexists_ind
                  @ ^ [X: mu] :
                      ( Phi @ X ) ) ) ) ) ) ).

%----Axiom 3
thf(ax3,axiom,(mvalid @ (pos_prop @ god))).


%----Theorem 2
thf(thm2,conjecture,
    (mvalid
    @ (mdia_s5
      @ ( mexists_ind
        @ ^ [X: mu] : (god @ X))))).
   
    
   