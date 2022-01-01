not_zero(s(_)).

% A + B = C
add(A, z, A).
add(A, s(B), s(C)) :- add(A, B, C).

% A - B = C
sub(A, B, C) :- add(C, B, A).

% N divides D if:
% - N is zero
% - N-D divides D
% (there are no negative numbers in our representation, so no infinite loops)
divisible(z, D) :- not_zero(D).
divisible(N, D) :- not_zero(D), sub(N, D, NminusD), divisible(NminusD, D).
not_divisible(N, D) :- \+ divisible(N, D).

% We just use this for I/O and testing
tonum(z, 0).
tonum(s(N), Num) :- tonum(N, Num1), Num is Num1+1.

fromnum(0, z).
fromnum(Num, s(N)) :- Num > 0, Num1 is Num-1, fromnum(Num1, N).

% Just to make fizzbuzz more readable
divisible_by_three(N) :- divisible(N, s(s(s(z)))).
not_divisible_by_three(N) :- \+ divisible_by_three(N).
divisible_by_five(N) :- divisible(N, s(s(s(s(s(z)))))).
not_divisible_by_five(N) :- \+ divisible_by_five(N).

fizzbuzz(N, 'FizzBuzz') :- divisible_by_three(N), divisible_by_five(N).
fizzbuzz(N, 'Fizz') :- divisible_by_three(N), not_divisible_by_five(N).
fizzbuzz(N, 'Buzz') :- divisible_by_five(N), not_divisible_by_three(N).
fizzbuzz(N, W) :- not_divisible_by_three(N), not_divisible_by_five(N), tonum(N, W).

% We could define this without the tonum/fromnum, but it's a bit more readable
num_between(X, A, B) :- A =< B, fromnum(A, X).
num_between(X, A, B) :- A < B, A1 is A+1, num_between(X, A1, B).

write_fizzbuzz(X) :- fizzbuzz(X, W), write(W), nl.

fizzbuzzloop :-
  num_between(X, 1, 100),
  write_fizzbuzz(X),
  fail.
