% graph edges (undirected for simplicity)
edge(a, b). edge(a, c).
edge(b, d). edge(c, d).
edge(d, goal).

% heuristic estimates (lower = closer to goal)
h(a, 5). h(b, 3). h(c, 4). h(d, 1). h(goal, 0).

% neighbors (undirected)
neighbor(X,Y) :- edge(X,Y).
neighbor(X,Y) :- edge(Y,X).

% greedy best-first: choose current with smallest h
best_first(Start, Goal, Path) :-
    best_first_search([node(Start, [Start])], Goal, PathRev),
    reverse(PathRev, Path).

best_first_search([node(Goal, Path)|_], Goal, Path).
best_first_search([node(N, Path)|Rest], Goal, SolPath) :-
    N \= Goal,
    findall(node(M, [M|Path]),
            (neighbor(N,M), \+ member(M, Path)),
            Children),
    append(Rest, Children, NewOpen),
    sort_by_h(NewOpen, SortedOpen),
    best_first_search(SortedOpen, Goal, SolPath).

% sort list of node(Name,Path) by h(Name, _)
sort_by_h(List, Sorted) :-
    map_list_to_pairs(node_h, List, Pairs),
    keysort(Pairs, SortedPairs),
    pairs_values(SortedPairs, Sorted).

node_h(node(N,_), H) :- h(N,H).
