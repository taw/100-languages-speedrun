#!/usr/bin/env elvish

trap PIPE EXIT
fn fib {|a b|
  echo $a
  fib $b (+ $a $b)
}

fib 1 1
