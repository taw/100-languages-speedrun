#!/usr/bin/env raku

sub is_small_int($n) {
  !!($n ~~ /^ \d ** {1..6} $ /)
}

my @examples = (
  # Correctly True
  '0',
  '0001',
  '12345',
  # Correct False
  '-17',
  '1234567',
  '3.14',
  # Raku Bug
  '๓๓๓',
  '௫๓௫๓',
  '១๑໑',
);

for @examples -> $n {
  say "is_small_int($n) = ", is_small_int($n);
}
