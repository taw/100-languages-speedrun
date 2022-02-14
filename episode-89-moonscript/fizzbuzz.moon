#!/usr/bin/env moon

for i = 1, 100
  if i % 15 == 0
    print "FizzBuzz"
  elseif i % 5 == 0
    print "Buzz"
  elseif i % 3 == 0
    print "Fizz"
  else
    print i
