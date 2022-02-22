#!/usr/bin/env ruby

def divisible_by(n)
  proc{|m| m % n == 0}
end

puts (1..100).map{|n|
  case n
  when divisible_by(15)
    "FizzBuzz"
  when divisible_by(5)
    "Buzz"
  when divisible_by(3)
    "Fizz"
  else
    n
  end
}
