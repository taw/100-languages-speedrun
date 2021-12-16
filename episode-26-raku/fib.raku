#!/usr/bin/env raku

multi sub fib(1) { 1 }
multi sub fib(2) { 1 }
multi sub fib($n) { fib($n-1) + fib($n-2) }

for 1..30 {
  say fib($_)
}
