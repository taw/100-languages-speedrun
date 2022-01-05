#!/usr/bin/env raku

my $number_regexp = rx/
  ^
  '-'?
  <[0..9]>+
  [
    '.'
    <[0..9]>+
  ]?
  $
/;

my @examples = (
  # Numbers
  '0004',
  '-123',
  '1234.5678',
  '-3.14',
  # Not numbers
  '1.2.3',
  '.8',
  '-5.',
  '๓๓๓',
  '௫๓௫๓',
  '១๑໑',
);

for @examples -> $n {
  say $n, ($n ~~ $number_regexp) ?? " is a number" !! " is NOT a number";
}
