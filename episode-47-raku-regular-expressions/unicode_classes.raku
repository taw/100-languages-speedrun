#!/usr/bin/env raku

sub is_unicode_digits($n) {
  !!($n ~~ /^ <:N> ** {1..6} $ /)
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
  # Non ASCII digits
  '๓๓๓',
  '௫๓௫๓',
  '១๑໑',
);

for @examples -> $n {
  say "is_unicode_digits($n) = ", is_unicode_digits($n);
}
