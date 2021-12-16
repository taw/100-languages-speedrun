#!/usr/bin/perl -l

use JSON;

my $x = 2;
print encode_json($x);
print "$x";
print encode_json($x);
