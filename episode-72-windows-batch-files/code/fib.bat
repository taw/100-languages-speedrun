@echo off
set /a i = 1
set /a a = 1
set /a b = 1
:loop

echo fib(%i%)=%a%

set /a i = 1 + %i%
set /a c = %a% + %b%
set /a a = %b%
set /a b = %c%

if %i% neq 21 goto :loop
