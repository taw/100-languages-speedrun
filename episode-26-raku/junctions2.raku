#!/usr/bin/env raku

say "Some of them match!" if (1 | 2 | 3) * 2 == (4 | 5);
say "All of them match!" if (1 & 2) * 2 == (4 | 5 | 2);
