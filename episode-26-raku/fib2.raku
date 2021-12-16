#!/usr/bin/env raku

sub fib($n) {
  state %cache = (0 => 0, 1 => 1);
  %cache{$n} //= fib($n - 1) + fib($n - 2);
}

say fib($_) for 1..1000
