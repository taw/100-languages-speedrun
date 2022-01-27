#!/usr/bin/env raku

grammar KV {
  rule TOP { ^ <key> "=" <value> $ };
  regex id { <[a..zA..Z0..9]> + };
  regex key { <id> };
  regex value { <id> };
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
  if KV.parse($_) {
    say "PARSED: $_";
    say "MATCH: $/";
    say "KEY IS: $/.<key>";
    say "VALUE IS: $/.<value>";
    say "PARSE TREE:";
    say $/;
  } else {
    say "FAILED: $_";
  }
  say "";
}
