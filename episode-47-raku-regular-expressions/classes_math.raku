#!/usr/bin/env raku

# Some letters are too easy to confuse with numbers, filter them out
my $nice_letter_rx = rx/ ^ <[A..Z] + [a..z] - [lIO] > $/;

my @examples = ('a'..'z', 'A'..'Z', '0'..'9').flat;

for @examples -> $c {
  say $c, " is not a nice letter" unless $c ~~ $nice_letter_rx;
}
