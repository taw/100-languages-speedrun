#!/usr/bin/env pyret -q

fun fizzbuzz(n):
  if num-modulo(n, 15) == 0:
    "FizzBuzz"
  else if num-modulo(n, 5) == 0:
    "Buzz"
  else if num-modulo(n, 3) == 0:
    "Fizz"
  else:
    to-string(n)
  end
end
check:
  fizzbuzz(30) is "FizzBuzz"
  fizzbuzz(31) is "31"
  fizzbuzz(33) is "Fizz"
  fizzbuzz(35) is "Buzz"
end

for each(n from range(1, 101)):
  print(fizzbuzz(n) + "\n")
end
