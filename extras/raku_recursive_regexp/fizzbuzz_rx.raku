#!/usr/bin/env raku

my $rx3_part = rx/
  [
  | <[0369]>                              # 0
  | <[147]> <~~>? <[258]>                 # 1+2
  | <[147]> <~~>? <[147]> <~~>? <[147]>   # 1+1+1
  | <[258]> <~~>? <[147]>                 # 2+1
  | <[258]> <~~>? <[258]> <~~>? <[258]>   # 2+2+2
  ]
  <~~>?
/;
my $rx3 = /^ $rx3_part $/;
my $rx5 = /^ <[0..9]>* <[05]> $/;
my $rx15 = / $rx3 && $rx5 /;

for 1..100 -> $n {
  # In Raku we need to convert Int to Str, otherwise can't s/// it
  # In Perl it would magically change type for us
  $_ = "$n";
  s/^ $rx15 $/FizzBuzz/;
  s/^ $rx5 $/Buzz/;
  s/^ $rx3 $/Fizz/;
  say $_;
}
