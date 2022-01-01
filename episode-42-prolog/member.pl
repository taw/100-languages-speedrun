list_member(X, [X|_]).
list_member(X, [_|T]) :- list_member(X, T).

member_twice(X, [X|T]) :- list_member(X, T).
member_twice(X, [_|T]) :- member_twice(X, T).
