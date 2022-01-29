@echo off
set /a i = 1
:loop

echo %i%

set /a i = 1 + %i%

if %i% neq 11 goto :loop
