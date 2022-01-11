#!/usr/bin/perl

while(<>) {
  $counts{lc$_}++ for /\w+/g;
}

my @top = sort { $counts{$b} <=> $counts{$a} || $a cmp $b } keys %counts;
for (@top[0..9]) {
  print "$_: $counts{$_}\n";
}
