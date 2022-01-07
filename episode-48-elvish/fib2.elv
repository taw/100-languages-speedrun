#!/usr/bin/env elvish

fn fib {|a b|
  echo $a
  fib $b (+ $a $b)
}

try {
  fib 1 1
} except e {
  echo $e[reason] >&2
}
