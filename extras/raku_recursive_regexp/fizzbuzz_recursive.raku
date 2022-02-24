#!/usr/bin/env raku

my regex m3r0 {
  [
  | <[0369]> <m3r0>?
  | <[147]> <m3r2>
  | <[258]> <m3r1>
  ]
};
my regex m3r1 {
  [
  | <[0369]> <m3r1>
  | <[147]> <m3r0>?
  | <[258]> <m3r2>
  ]
};
my regex m3r2 {
  [
  | <[0369]> <m3r2>
  | <[147]> <m3r1>
  | <[258]> <m3r0>?
  ]
};

my $rx3 = /^ <m3r0> $/;
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
