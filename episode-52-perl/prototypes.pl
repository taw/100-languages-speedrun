#!/usr/bin/perl

sub titleize ($) {
  my ($word) = (@_);
  $word = lc$word;
  $word =~ s/\b./uc$&/eg;
  $word;
}

print "Hello ", titleize "alice SMITH", "!\n";
