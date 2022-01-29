@echo off
set /a i = 1

:loop

set /a fizzbuzz = %i% %% 15
set /a fizz = %i% %% 3
set /a buzz = %i% %% 5

set /a t = %i%
if %fizz% == 0 set t=Fizz
if %buzz% == 0 set t=Buzz
if %fizzbuzz% == 0 set t=FizzBuzz

echo %t%

set /a i = 1 + %i%
if %i% neq 101 goto :loop
