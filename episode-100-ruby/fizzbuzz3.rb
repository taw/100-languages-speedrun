#!/usr/bin/env ruby

puts (1..100).map{|n|
  case [n%5, n%3]
  in [0, 0]
    "FizzBuzz"
  in [0, _]
    "Buzz"
  in [_, 0]
    "Fizz"
  else
    n
  end
}
