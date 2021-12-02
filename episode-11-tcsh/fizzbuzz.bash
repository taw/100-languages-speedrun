#!/bin/bash

(( num = 1 ))
while (( num <= 100 ))
do
  if (( num % 15 == 0 ))
  then
    echo "FizzBuzz"
  elif (( num % 3 == 0 ))
  then
    echo "Fizz"
  elif (( num % 5 == 0 ))
  then
    echo "Buzz"
  else
    echo $num
  fi
  (( num ++ ))
done
