move(state(middle, onbox, middle, hasnot),
     grab,
     state(middle, onbox, middle, has)).

move(state(P, onfloor, P, H),
     climb,
     state(P, onbox, P, H)).

move(state(P1, onfloor, B, H),
     walk(P1, P2),
     state(P2, onfloor, B, H)).

solve(S, []) :- S = state(_, _, _, has).

solve(S, [Action|Rest]) :-
    move(S, Action, NewState),
    solve(NewState, Rest).
