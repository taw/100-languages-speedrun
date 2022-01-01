len(0, []).
len(L, [_|T]) :- len(LT, T), L is 1+LT.
