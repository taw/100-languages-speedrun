#!/usr/bin/env raku

say "What's your name?";
my $name = get;

if ($name ~~ /^<[a..z]>+$/ | /^<[A..Z]>+$/) {
  say "Hello, $name"
} else {
  say "Please use consistent case"
}
