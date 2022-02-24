#!/usr/bin/env raku

grammar Math {
  rule TOP { ^ <expr> $ };
  rule expr { <number> | <parens> };
  rule parens { "(" <expr> ")" };
  regex number { "-"? <[0..9]>+ ["." <[0..9]>*]? };
}

my @examples = (
  "100",
  "-4.20",
  "(5)",
  "(((((5)))))",
  "(((((5))))))"
);

for @examples {
  if Math.parse($_) {
    say $/;
  } else {
    say "Failed: $_";
  }
}
