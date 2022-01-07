#!/usr/bin/env raku

signal(SIGPIPE).tap:{exit};

say $_ for 1..1_000_000;
