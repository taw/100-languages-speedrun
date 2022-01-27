#!/usr/bin/env ioke

Number fizzbuzz = method(
  if(self % 15 == 0, "FizzBuzz",
    if(self % 5 == 0, "Buzz",
      if(self % 3 == 0, "Fizz",
        self))))

for(i <- 1..100, i fizzbuzz println)
