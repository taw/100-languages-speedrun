father(philip3, maria_anna).
father(philip3, philip4).
father(philip4, charles2).

mother(maria_anna, mariana).
mother(mariana, charles2).

parent(A, B) :- father(A, B).
parent(A, B) :- mother(A, B).

ancestor1(A, B) :- parent(A, B).
ancestor1(A, B) :- parent(A, X), ancestor1(X, B).

ancestor2(A, B) :- parent(A, B).
ancestor2(A, B) :- ancestor2(X, B), parent(A, X).
