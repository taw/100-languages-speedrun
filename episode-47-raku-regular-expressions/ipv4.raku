#!/usr/bin/env raku

my $rx = rx/
  ^
  [
  | <[0..9]>            # 0-9
  | <[1..9]> <[0..9]>   # 10-99
  | 1 <[0..9]> ** 2     # 100-199
  | 2 <[0..4]> <[0..9]> # 200-249
  | 25 <[0..5]>         # 250-255
  ] ** 4 % '.'
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
