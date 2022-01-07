#!/usr/bin/env ruby

# FizzBuzz in Crystal. Also in Ruby.
(1..100).each do |n|
  if n % 15 == 0
    puts "FizzBuzz"
  elsif n % 3 == 0
    puts "Fizz"
  elsif n % 5 == 0
    puts "Buzz"
  else
    puts n
  end
end
