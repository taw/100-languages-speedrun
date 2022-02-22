#!/usr/bin/env ruby

fib = Hash.new{|_, n| fib[n] = fib[n-1] + fib[n-2]}
fib[1] = 1
fib[2] = 1

(200..210).each do |n|
  puts "fib(#{n}) = #{fib[n]}"
end
