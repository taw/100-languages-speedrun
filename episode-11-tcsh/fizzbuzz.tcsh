#!/bin/tcsh

set num = 1
while ( $num <= 100 )
  if ( $num % 15 == 0 ) then
    echo "FizzBuzz"
  else if ( $num % 3 == 0 ) then
    echo "Fizz"
  else if ( $num % 5 == 0 ) then
    echo "Buzz"
  else
    echo $num
  endif
  @ num ++
end
