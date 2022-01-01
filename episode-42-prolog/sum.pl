sum(0, []).
sum(S, [H|T]) :- sum(ST, T), S is H+ST.
