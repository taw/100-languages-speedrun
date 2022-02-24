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

for 1..100 -> $a {
  for 1..9 -> $b {
    my $n = $b * (10 ** $a);
    my $m = $n % 7;
    my @d;
    push @d, 0 if "$n" ~~ /^ &d7r0 /;
    push @d, 1 if "$n" ~~ /^ &d7r1 /;
    push @d, 2 if "$n" ~~ /^ &d7r2 /;
    push @d, 3 if "$n" ~~ /^ &d7r3 /;
    push @d, 4 if "$n" ~~ /^ &d7r4 /;
    push @d, 5 if "$n" ~~ /^ &d7r5 /;
    push @d, 6 if "$n" ~~ /^ &d7r6 /;
    unless [$m] eqv @d {
      say "FAIL: $n: actual: $m, regex: [", join(",", @d), "]";
    }
  }
}
