%----Axioms for Quantified Modal Logic S5 (providing quantification over 
%----individuals, propositions, sets of individuals, sets of sets of individual).

include('Quantified_S5.ax').

%------------------------------------------------------------------------------

thf(god_tp,type,( god : mu > $i > $o )).
thf(positive_tp,type,( positive : (mu > $i > $o) > $i > $o )).

%----Definition of god
thf(god_def,definition, ( god =
    ( ^ [X: mu] :
      ( mforall_indset
         @ ( ^ [P: mu > $i > $o] :
             ( mimplies @
               ( positive @ P ) @
               ( P @ X ) ) ) ) ) ) ).
    
%----Assuming Theorem 1 (proved before) 
thf(thm1,axiom,
    ( mvalid
    @ ( mforall_indset
          @ ^ [P: mu > $i > $o] :
              ( mimplies @ ( positive @ P )
              @ ( mdia_s5
                @ ( mexists_ind
                  @ ^ [X: mu] :
                      ( P @ X ) ) ) ) ) ) ).

%----Axiom 3
thf(ax3,axiom,(mvalid @ (positive @ god))).

% LEO-II and Satallax can prove this very quickly
%----Theorem 2
thf(thm2,conjecture,
    (mvalid
    @ (mdia_s5
      @ ( mexists_ind
        @ ^ [X: mu] : (god @ X))))).
   
    
   