len(0, []).
len(L, [_|T]) :- len(LT, T), L=1+LT.
