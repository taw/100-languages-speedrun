@echo off
setlocal enableDelayedExpansion
for /l %%j in (1 1 100) do (
  set /a fizz = %%j %% 3
  set /a buzz = %%j %% 5
  set /a fizzbuzz = %%j %% 15
  if !fizzbuzz! == 0 (
    echo FizzBuzz
  ) else if !buzz! == 0 (
    echo Buzz
  ) else if !fizz! == 0 (
    echo Fizz
  ) else (
    echo %%j
  )
)
