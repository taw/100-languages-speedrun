#!/usr/bin/env ruby

def memoize(name)
  m = method(name)
  define_method(name) do |*args|
    @memo ||= {}
    @memo[name] ||= {}
    @memo[name][args] ||= m.call(*args)
  end
end

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
