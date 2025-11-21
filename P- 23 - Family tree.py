parent(ram, siva).
parent(ram, priya).
parent(geetha, siva).
parent(geetha, priya).

male(ram).
male(siva).
female(geetha).
female(priya).

father(X, Y) :- parent(X, Y), male(X).
mother(X, Y) :- parent(X, Y), female(X).
sibling(X, Y) :- parent(P, X), parent(P, Y), X \= Y.
