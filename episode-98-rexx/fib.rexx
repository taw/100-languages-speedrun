#!/usr/bin/env rexx

do i = 1 to 20
  say "fib(" || i || ")=" || fib(i)
end

fib:
  parse arg n
  if n <= 2 then
    return 1
  else
    return fib(n - 1) + fib(n - 2)
