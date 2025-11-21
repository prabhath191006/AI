bird(sparrow).
bird(eagle).
bird(penguin).

fly(sparrow).
fly(eagle).

can_fly(X) :- fly(X).
cannot_fly(X) :- bird(X), \+ fly(X).
