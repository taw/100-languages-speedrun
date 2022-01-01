add(A, z, A).
add(A, s(B), s(C)) :- add(A, B, C).

sum(z, []).
sum(S, [H|T]) :- sum(ST, T), add(H, ST, S).
