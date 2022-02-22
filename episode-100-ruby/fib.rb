#!/usr/bin/env ruby

def fib(n)
  if n <= 2
    1
  else
    fib(n-1) + fib(n-2)
  end
end

(1..30).each do |n|
  puts "fib(#{n}) = #{fib(n)}"
end
