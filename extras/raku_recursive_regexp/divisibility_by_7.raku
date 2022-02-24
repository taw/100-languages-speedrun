#!/usr/bin/env raku

my regex d7r0 { <[07]> };
my regex d7r1 {
  [
  | <[18]> <?before [.**6]* $ >
  | <[29]> <?before .**4 [.**6]* $ >
  | 3 <?before .**5 [.**6]* $ >
  | 4 <?before .**2 [.**6]* $ >
  | 5 <?before .**1 [.**6]* $ >
  | 6 <?before .**3 [.**6]* $ >
  ]
};
my regex d7r2 {
  [
  | <[18]> <?before .**2 [.**6]* $ >
  | <[29]> <?before [.**6]* $ >
  | 3 <?before .**1 [.**6]* $ >
  | 4 <?before .**4 [.**6]* $ >
  | 5 <?before .**3 [.**6]* $ >
  | 6 <?before .**5 [.**6]* $ >
  ]
};
my regex d7r3 {
  [
  | <[18]> <?before .**1 [.**6]* $ >
  | <[29]> <?before .**5 [.**6]* $ >
  | 3 <?before [.**6]* $ >
  | 4 <?before .**3 [.**6]* $ >
  | 5 <?before .**2 [.**6]* $ >
  | 6 <?before .**4 [.**6]* $ >
  ]
};
my regex d7r4 {
  [
  | <[18]> <?before .**4 [.**6]* $ >
  | <[29]> <?before .**2 [.**6]* $ >
  | 3 <?before .**3 [.**6]* $ >
  | 4 <?before [.**6]* $ >
  | 5 <?before .**5 [.**6]* $ >
  | 6 <?before .**1 [.**6]* $ >
  ]
};
my regex d7r5 {
  [
  | <[18]> <?before .**5 [.**6]* $ >
  | <[29]> <?before .**3 [.**6]* $ >
  | 3 <?before .**4 [.**6]* $ >
  | 4 <?before .**1 [.**6]* $ >
  | 5 <?before [.**6]* $ >
  | 6 <?before .**2 [.**6]* $ >
  ]
};
my regex d7r6 {
  [
  | <[18]> <?before .**3 [.**6]* $ >
  | <[29]> <?before .**1 [.**6]* $ >
  | 3 <?before .**2 [.**6]* $ >
  | 4 <?before .**5 [.**6]* $ >
  | 5 <?before .**4 [.**6]* $ >
  | 6 <?before [.**6]* $ >
  ]
};

my regex m7r0 {
  [
  | &d7r0
  | &d7r0 &m7r0
  | &d7r1 &m7r6
  | &d7r2 &m7r5
  | &d7r3 &m7r4
  | &d7r4 &m7r3
  | &d7r5 &m7r2
  | &d7r6 &m7r1
  ]
};
my regex m7r1 {
  [
  | &d7r1
  | &d7r1 &m7r0
  | &d7r2 &m7r6
  | &d7r3 &m7r5
  | &d7r4 &m7r4
  | &d7r5 &m7r3
  | &d7r6 &m7r2
  | &d7r0 &m7r1
  ]
};
my regex m7r2 {
  [
  | &d7r2
  | &d7r2 &m7r0
  | &d7r3 &m7r6
  | &d7r4 &m7r5
  | &d7r5 &m7r4
  | &d7r6 &m7r3
  | &d7r0 &m7r2
  | &d7r1 &m7r1
  ]
};
my regex m7r3 {
  [
  | &d7r3
  | &d7r3 &m7r0
  | &d7r4 &m7r6
  | &d7r5 &m7r5
  | &d7r6 &m7r4
  | &d7r0 &m7r3
  | &d7r1 &m7r2
  | &d7r2 &m7r1
  ]
};
my regex m7r4 {
  [
  | &d7r4
  | &d7r4 &m7r0
  | &d7r5 &m7r6
  | &d7r6 &m7r5
  | &d7r0 &m7r4
  | &d7r1 &m7r3
  | &d7r2 &m7r2
  | &d7r3 &m7r1
  ]
};
my regex m7r5 {
  [
  | &d7r5
  | &d7r5 &m7r0
  | &d7r6 &m7r6
  | &d7r0 &m7r5
  | &d7r1 &m7r4
  | &d7r2 &m7r3
  | &d7r3 &m7r2
  | &d7r4 &m7r1
  ]
};
my regex m7r6 {
  [
  | &d7r6
  | &d7r6 &m7r0
  | &d7r0 &m7r6
  | &d7r1 &m7r5
  | &d7r2 &m7r4
  | &d7r3 &m7r3
  | &d7r4 &m7r2
  | &d7r5 &m7r1
  ]
};

for 0..1000 -> $n {
  my $m = $n % 7;
  my @d;
  push @d, 0 if "$n" ~~ /^ &m7r0 $/;
  push @d, 1 if "$n" ~~ /^ &m7r1 $/;
  push @d, 2 if "$n" ~~ /^ &m7r2 $/;
  push @d, 3 if "$n" ~~ /^ &m7r3 $/;
  push @d, 4 if "$n" ~~ /^ &m7r4 $/;
  push @d, 5 if "$n" ~~ /^ &m7r5 $/;
  push @d, 6 if "$n" ~~ /^ &m7r6 $/;
  unless [$m] eqv @d {
    say "FAIL: $n: actual: $m, regex: [", join(",", @d), "]";
  }
}
