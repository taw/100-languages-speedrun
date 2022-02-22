#!/usr/bin/env ruby

def fib(n)
  @fib ||= {}
  @fib[n] ||= begin
    if n <= 2
      1
    else
      fib(n-1) + fib(n-2)
    end
  end
end

(200..210).each do |n|
  puts "fib(#{n}) = #{fib(n)}"
end
