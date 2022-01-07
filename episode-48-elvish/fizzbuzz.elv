#!/usr/bin/env elvish

# FizzBuzz in Elvish
fn fizzbuzz {|n|
  if (== (% $n 15) 0) {
    echo "FizzBuzz"
  } elif (== (% $n 5) 0) {
    echo "Buzz"
  } elif (== (% $n 3) 0) {
    echo "Fizz"
  } else {
    echo $n
  }
}

seq 1 100 | each {|n| fizzbuzz $n}
