divisible(N, D) :- 0 is N mod D.
not_divisible(N, D) :- \+ divisible(N, D).

fizzbuzz(N, 'FizzBuzz') :- divisible(N, 15).
fizzbuzz(N, 'Fizz') :- divisible(N, 3), not_divisible(N, 5).
fizzbuzz(N, 'Buzz') :- divisible(N, 5), not_divisible(N, 3).
fizzbuzz(N, N) :- not_divisible(N, 3), not_divisible(N, 5).

num_between(X, A, B) :- A =< B, X = A.
num_between(X, A, B) :- A < B, A1 is A+1, num_between(X, A1, B).

write_fizzbuzz(X) :- fizzbuzz(X, W), write(W), nl.

fizzbuzzloop :-
  num_between(X, 1, 100),
  write_fizzbuzz(X),
  fail.
