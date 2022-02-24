#!/usr/bin/env raku

my regex m7r0 {
  [
  | <[07]>
  | <[07]> &m7r0
  | <[18]> &m7r4
  | <[29]> &m7r1
  | 3 &m7r5
  | 4 &m7r2
  | 5 &m7r6
  | 6 &m7r3
  ]
};
my regex m7r1 {
  [
  | <[18]>
  | <[07]> &m7r0
  | <[18]> &m7r4
  | <[29]> &m7r1
  | 3 &m7r5
  | 4 &m7r2
  | 5 &m7r6
  | 6 &m7r3
  ]
};
my regex m7r2 {
  [
  | <[29]>
  | <[07]> &m7r0
  | <[18]> &m7r4
  | <[29]> &m7r1
  | 3 &m7r5
  | 4 &m7r2
  | 5 &m7r6
  | 6 &m7r3
  ]
};
my regex m7r3 {
  [
  | 3
  | <[07]> &m7r0
  | <[18]> &m7r4
  | <[29]> &m7r1
  | 3 &m7r5
  | 4 &m7r2
  | 5 &m7r6
  | 6 &m7r3
  ]
};
my regex m7r4 {
  [
  | 4
  | <[07]> &m7r0
  | <[18]> &m7r4
  | <[29]> &m7r1
  | 3 &m7r5
  | 4 &m7r2
  | 5 &m7r6
  | 6 &m7r3
  ]
};
my regex m7r5 {
  [
  | 5
  | <[07]> &m7r0
  | <[18]> &m7r4
  | <[29]> &m7r1
  | 3 &m7r5
  | 4 &m7r2
  | 5 &m7r6
  | 6 &m7r3
  ]
};
my regex m7r6 {
  [
  | 6
  | <[07]> &m7r0
  | <[18]> &m7r4
  | <[29]> &m7r1
  | 3 &m7r5
  | 4 &m7r2
  | 5 &m7r6
  | 6 &m7r3
  ]
};

my $rx4 = /^
  [
  | <[0..9]>* <[02468]> <[048]>
  | <[0..9]>* <[13579]> <[26]>
  | <[02468]>? <[048]>
  ]
  $/;
my $rx7 = /^ &m7r0 $/;
my $rx47 = / $rx4 && $rx7 /;

for 0..1_000_000 -> $n {
  $_ = "$n";
  s/^ $rx47 $/FizzBuzz/;
  s/^ $rx7 $/Buzz/;
  s/^ $rx4 $/Fizz/;
  say $_;
}