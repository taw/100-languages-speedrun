#!/usr/bin/env raku

grammar Math {
  rule TOP { ^ <expr> $ };
  rule expr { <value> <op> <value> | <value> };
  rule value { <number> | <parens> };
  rule parens { "(" <expr> ")" };
  rule operation { <expr> <op> <expr> };
  regex number { "-"? <[0..9]>+ ["." <[0..9]>*]? };
  regex op { "+" };
};

my @examples = (
  "100",
  "-4.20",
  "((5))",
  "2+3",
  "(2+3)",
  "2+3",
  "2+3+4",
);

for @examples {
  if Math.parse($_) {
    say $/
  } else {
    note "Parse error: $_"
  }
}
