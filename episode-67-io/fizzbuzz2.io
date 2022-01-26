#!/usr/bin/env io

Number fizzbuzz := method(
  (self % 15 == 0) ifTrue (return "FizzBuzz")
  (self % 5 == 0) ifTrue (return "Buzz")
  (self % 3 == 0) ifTrue (return "Fizz")
  self
)

100 repeat(i, (i+1) fizzbuzz println)
