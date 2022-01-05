#!/usr/bin/env raku

my $rx = rx/
  ^
  <[0..9]> ** {1..3}
  '.'
  <[0..9]> ** {1..3}
  '.'
  <[0..9]> ** {1..3}
  '.'
  <[0..9]> ** {1..3}
  $
/;

my @examples = (
  '127.0.1',
  '8.8.8.8',
  '127.0.0.420',
  '127.0.0.9001',
);

for @examples -> $n {
  say $n, ($n ~~ $rx) ?? " looks like IP address" !! " does NOT look like IP address";
}
