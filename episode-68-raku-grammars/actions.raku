#!/usr/bin/env raku

grammar KV {
  rule TOP { ^ <key> "=" <value> $ };
  regex id { <[a..zA..Z0..9]> + };
  regex key { <id> };
  regex value { <id> };
};

class KVActions {
  method TOP($/) {
    make { $/.<key>.made => $/.<value>.made }
  }
  method key($/) { make $/.<id>.made }
  method value($/) { make $/.<id>.made }
  method id($/) { make $/.Str }
};

my @examples = (
  "cat=cute",
  "4=5",
  "cat = fluffy",
  "cat",
  "cat=dog=ferret",
  "c a t = d o g",
);
for @examples {
  if KV.parse($_, actions => KVActions) {
    say "PARSED: $_";
    say "RESULT: ", $/.made;
  } else {
    say "FAILED: $_";
  }
  say "";
}
