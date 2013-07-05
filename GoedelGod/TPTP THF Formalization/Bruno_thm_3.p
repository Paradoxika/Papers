%----Axioms for Quantified Modal Logic S5 (providing quantification over 
%----individuals, propositions, sets of individuals, sets of sets of individual).

include('Quantified_S5.ax').

%------------------------------------------------------------------------------


thf(god_tp,type,(
    god: mu > $i > $o )).

thf(positive_tp,type,(
    positive: ( mu > $i > $o ) > $i > $o )).

thf(essential_tp,type,(
    essential: ( mu > $i > $o ) > mu > $i > $o )).

%----Definition of god
thf(god_def,definition,
    ( god
    = ( ^ [X: mu] :
          ( mforall_indset
          @ ^ [P: mu > $i > $o] :
              ( mimplies @ ( positive @ P ) @ ( P @ X ) ) ) ) )).

%----Assuming Theorem 1 (proved before) 
thf(thm1,axiom,
    ( mvalid
    @ ( mforall_indset
      @ ^ [P: mu > $i > $o] :
          ( mimplies @ ( positive @ P )
          @ ( mdia_s5
            @ ( mexists_ind
              @ ^ [X: mu] :
                  ( P @ X ) ) ) ) ) )).

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


%----Axiom 2 boxed
thf(ax2b,axiom,
    ( mvalid @ ( mbox_s5 @ (
          ( mforall_indset
          @ ^ [P: mu > $i > $o] :
              ( mequiv
              @ ( positive
                @ ^ [W: mu] :
                    ( mnot @ ( P @ W ) ) )
              @ ( mnot @ ( positive @ P ) ) ) ) ) ) ) ).              

%----Axiom 3
thf(ax3,axiom,
    ( mvalid @ ( positive @ god ) )).

%----Assuming Theorem 2 (proved before)
thf(thm2,conjecture,
    ( mvalid
    @ ( mdia_s5
      @ ( mexists_ind
        @ ^ [X: mu] :
            ( god @ X ) ) ) )).

thf(essential_def,definition,
    ( essential
    = ( ^ [P: mu > $i > $o,X: mu] :
          ( mand @ ( P @ X )
          @ ( mforall_indset
            @ ^ [Q: mu > $i > $o] :
                ( mimplies @ ( Q @ X )
                @ ( mbox_s5
                  @ ( mforall_ind
                    @ ^ [Z: mu] :
                        ( mimplies @ ( P @ Z ) @ ( Q @ Z ) ) ) ) ) ) ) ) )).

%----Axiom 4 
thf(ax4,axiom,
    ( mvalid
    @ ( mforall_indset
      @ ^ [P: mu > $i > $o] :
          ( mimplies @ ( positive @ P ) @ ( mbox_s5 @ ( positive @ P ) ) ) ) )).


%----Axiom 4 boxed
thf(ax4b,axiom,
    ( mvalid @ ( mbox_s5
    @ ( mforall_indset
      @ ^ [P: mu > $i > $o] :
          ( mimplies @ ( positive @ P ) @ ( mbox_s5 @ ( positive @ P ) ) ) ) ) ) ).


%----Theorem 3
thf(thm3,conjecture,
    ( mvalid
    @ ( mforall_ind
      @ ^ [Y: mu] :
          ( mimplies @ ( god @ Y ) @ ( essential @ god @ Y ) ) ) )).

% Here is an informal presentation of the counterexample
% found by Nitrox (see the details below):
% - we have one world i1 and i1 is reachable from itself via rel_s5
% - we have two individuals b1 and b2
% - positive holds for    
%  
% - positive:
%      {(b1,i1),(b2,i1)} -> {i1}
%      {(b1,i1)}         -> {}
%      {(b2,i1)}         -> {}   
%      {}                -> {}
%   
% - essential:
%      {(b1,i1),(b2,i1)} -> {}      
%      {(b1,i1)}         -> {(b1,i1)}
%      {(b2,i1)}         -> {(b2,i1)}   
%      {}                -> {(b1,i1),(b2,i1)}
%
% - god:   
%      {(b1,i1),(b2,i1)}
%
% How to interpret this counterexample:
%
% We have two gods in world i1 (the only world). Let's focus on this property
% (relation) which we can note as two_gods_property := {(b1,i1),(b2,i1)}.
% Let's assume that positive holds for this
% property, that is, let's assume that having two gods is positive property.
% Now consider the case where  essential doesn't hold for the
% two_gods_property (for neither of the two gods). 
% Then theorem 3 cleary evaluates to false.   
   
% When we enforce that there is just one world:
%
% thf(w_tp,type,(w:$i)).
% thf(ax0,axiom,(![X:$i]: (X = w))).   
%
% and use axioms instead of definitions for god and essential    
% then we get this the following small countermodel
%     
% Nitpick found a counterexample for card TPTP_Interpret.ind = 1 and
% card bnd_mu = 2:
%
%  Skolem constants:
%    bnd_mforall_ind.X = b1
%    bnd_mvalid.W = i1
%  Constants:
%    bnd_essential =
%      (%x. _)
%      ((%x. _)(b1 := (%x. _)(i1 := True), b2 := (%x. _)(i1 := True)) :=
%         (%x. _)(b1 := (%x. _)(i1 := False), b2 := (%x. _)(i1 := False)),
%       (%x. _)(b1 := (%x. _)(i1 := True), b2 := (%x. _)(i1 := False)) :=
%         (%x. _)(b1 := (%x. _)(i1 := True), b2 := (%x. _)(i1 := False)),
%       (%x. _)(b1 := (%x. _)(i1 := False), b2 := (%x. _)(i1 := True)) :=
%         (%x. _)(b1 := (%x. _)(i1 := False), b2 := (%x. _)(i1 := True)),
%       (%x. _)(b1 := (%x. _)(i1 := False), b2 := (%x. _)(i1 := False)) :=
%         (%x. _)(b1 := (%x. _)(i1 := False), b2 := (%x. _)(i1 := False)))
%    bnd_god = (%x. _)(b1 := (%x. _)(i1 := True), b2 := (%x. _)(i1 := True))
%    bnd_positive =
%      (%x. _)
%      ((%x. _)(b1 := (%x. _)(i1 := True), b2 := (%x. _)(i1 := True)) :=
%         (%x. _)(i1 := True),
%       (%x. _)(b1 := (%x. _)(i1 := True), b2 := (%x. _)(i1 := False)) :=
%         (%x. _)(i1 := False),
%       (%x. _)(b1 := (%x. _)(i1 := False), b2 := (%x. _)(i1 := True)) :=
%         (%x. _)(i1 := False),
%       (%x. _)(b1 := (%x. _)(i1 := False), b2 := (%x. _)(i1 := False)) :=
%         (%x. _)(i1 := False))
%    bnd_rel_s5 = (%x. _)(i1 := (%x. _)(i1 := True))
%    bnd_w = i1
%% SZS output end FiniteModel
% Total time: 1.59 s.   


% When we enforce that there is just one world:
%
% thf(w_tp,type,(w:$i)).
% thf(ax0,axiom,(![X:$i]: (X = w))).   
%
% then we get this the following small countermodel
%   
% Nitpick found a counterexample for card bnd_mu = 2 and
% card TPTP_Interpret.ind = 1:
%
%  Skolem constants:
%    bnd_mbox_s5.V = i1
%    bnd_mforall_ind.X = b1
%    bnd_mforall_ind.X = b2
%    bnd_mforall_indset.X =
%      (%x. _)(b1 := (%x. _)(i1 := True), b2 := (%x. _)(i1 := False))
%    bnd_mforall_indset.X =
%      (%x. _)(b1 := (%x. _)(i1 := True), b2 := (%x. _)(i1 := False))
%    bnd_mvalid.W = i1
%  Constants:
%    bnd_positive =
%      (%x. _)
%      ((%x. _)(b1 := (%x. _)(i1 := True), b2 := (%x. _)(i1 := True)) :=
%         (%x. _)(i1 := True),
%       (%x. _)(b1 := (%x. _)(i1 := True), b2 := (%x. _)(i1 := False)) :=
%         (%x. _)(i1 := False),
%       (%x. _)(b1 := (%x. _)(i1 := False), b2 := (%x. _)(i1 := True)) :=
%         (%x. _)(i1 := False),
%       (%x. _)(b1 := (%x. _)(i1 := False), b2 := (%x. _)(i1 := False)) :=
%         (%x. _)(i1 := False))
%    bnd_rel_s5 = (%x. _)(i1 := (%x. _)(i1 := True))
%    bnd_w = i1
% SZS output end FiniteModel
   
