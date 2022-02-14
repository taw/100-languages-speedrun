#!/usr/bin/env moon

fib = (n) ->
  if n <= 2
    1
  else
    fib(n-1) + fib(n-2)

for n = 1,20
  print "fib(#{n})=#{fib(n)}"
