#!/usr/bin/env ruby

require "memoist"

extend Memoist

memoize def fib(n)
  if n <= 2
    1
  else
    fib(n-1) + fib(n-2)
  end
end

(200..210).each do |n|
  puts "fib(#{n}) = #{fib(n)}"
end
