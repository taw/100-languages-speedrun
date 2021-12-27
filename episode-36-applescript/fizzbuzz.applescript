#!/usr/bin/env osascript

on fizzbuzz(n)
  if n mod 15 is 0 then
    return "FizzBuzz"
  else if n mod 5 is 0 then
    return "Buzz"
  else if n mod 3 is 0 then
    return "Fizz"
  else
    return n as string
  end if
end fizzbuzz

repeat with n from 1 to 100
  log fizzbuzz(n)
end repeat
