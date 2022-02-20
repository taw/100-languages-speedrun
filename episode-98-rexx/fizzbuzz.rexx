#!/usr/bin/env rexx

do i = 1 to 100
  if i // 15 == 0 then
    say "FizzBuzz"
  else if i // 5 == 0 then
    say "Buzz"
  else if i // 3 == 0 then
    say "Fizz"
  else
    say i
end
