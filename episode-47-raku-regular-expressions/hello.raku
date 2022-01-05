#!/usr/bin/env raku

my $s = "Hello, World!";
say "We are saying Hello" if $s ~~ /Hello/;

$_ = "Hello, World!";
say "We are saying Hello" if m/Hello/;

# Spaces are ignored by default on the regexp side
# but not on substitution side
$_ = "Hello, World!";
s/ World /Alice/;
say $_;

# :i for case insensitive
$_ = "Hello, World!";
s:i/ world /Alice/;
say $_;

my $n = "Alice";
say "It is Alice" if $n ~~ regex {
  ^       # start of string
  (A | a) # lower or upper case A
  l       # lower case l
  i       # lower case i
  c       # lower case c
  e       # lower case e
  $       # end of string
}
