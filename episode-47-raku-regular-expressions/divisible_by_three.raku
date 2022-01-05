#!/usr/bin/env raku

my $divides_by_three_rx_part = rx/
  [
  | <[0369]>                              # 0
  | <[147]> <~~>? <[258]>                 # 1+2
  | <[147]> <~~>? <[147]> <~~>? <[147]>   # 1+1+1
  | <[258]> <~~>? <[147]>                 # 2+1
  | <[258]> <~~>? <[258]> <~~>? <[258]>   # 2+2+2
  ]
  <~~>?
/;
my $divides_by_three_rx = /^ $divides_by_three_rx_part $/;

for 1234560..1234579  {
  say $_, ($_ ~~ $divides_by_three_rx) ?? " divides by 3" !! " does NOT divide by 3";
}
