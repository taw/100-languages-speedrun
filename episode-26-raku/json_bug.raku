#!/usr/bin/env raku

use JSON::Tiny;

my $x = 2;
say to-json($x);
say "$x";
say to-json($x);
