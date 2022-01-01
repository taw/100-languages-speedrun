father(philip3, maria_anna).
father(philip3, philip4).
father(philip4, charles2).

mother(maria_anna, mariana).
mother(mariana, charles2).

parent(A, B) :- father(A, B).
parent(A, B) :- mother(A, B).

grandfather(A, B) :- father(A, X), parent(X, B).
grandmother(A, B) :- mother(A, X), parent(X, B).

grandparent(A, B) :- grandfather(A, B).
grandparent(A, B) :- grandmother(A, B).

greatgrandfather(A, B) :- father(A, X), grandparent(X, B).
