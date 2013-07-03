%----Axioms for Quantified Modal Logic S5 (providing quantification over 
%----individuals, propositions, sets of individuals, sets of sets of individual).

include('Quantified_S5.ax').

%------------------------------------------------------------------------------

% thf(god_tp,type,(god: mu > $i > $o)).
thf(positive_tp,type,(positive: (mu > $i > $o) > $i > $o )).
   
%----Axiom 1
thf(ax1,axiom,
    ( mvalid @
          ( mforall_indset
          @ ^ [P: mu > $i > $o] :
              ( mforall_indset
              @ ^ [Q: mu > $i > $o] :
                  ( mimplies
                  @ ( mand @ ( positive @ P )
                    @ ( mbox_s5
                      @ ( mforall_ind
                        @ ^ [X: mu] :
                            ( mimplies @ ( P @ X ) @ ( Q @ X ) ) ) ) )
                  @ ( positive @ Q ) ) ) ) ) ).

%----Axiom 2
thf(ax2,axiom,
    ( mvalid @
          ( mforall_indset
          @ ^ [P: mu > $i > $o] :
              ( mequiv
              @ ( positive
                @ ^ [W: mu] :
                    ( mnot @ ( P @ W ) ) )
              @ ( mnot @ ( positive @ P ) ) ) ) ) ).

% LEO-II and Satallax can quickly prove this
%----Conjecture 
thf(thm,conjecture,
    ( mvalid @
          ( mforall_indset
          @ ^ [P: mu > $i > $o] :
              ( mimplies @ ( positive @ P )
              @ ( mdia_s5
                @ ( mexists_ind
                  @ ^ [X: mu] :
                      ( P @ X ) ) ) ) ) ) ).
