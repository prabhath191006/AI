:- dynamic fact/1.

% initial facts
init :-
    retractall(fact(_)),
    assertz(fact(has_symptom(john, fever))),
    assertz(fact(has_symptom(john, cough))).

% rules as productions: if body true and not already asserted -> assert head
rule(disease(P,flu), (fact(has_symptom(P,fever)), fact(has_symptom(P,cough)))).
rule(disease(P,measles), (fact(has_symptom(P,fever)), fact(has_symptom(P,rash)))).

apply_rule(R) :-
    rule(Head, Body),
    Body,
    Head =.. [Pred|Args],
    Fact =.. [fact, Head],
    \+ Fact,                      % not yet asserted
    assertz(fact(Head)),
    !.

forward_chain :-
    ( apply_rule(_) -> forward_chain ; true ).

% helper to list derived facts
derived(F) :- fact(F).
