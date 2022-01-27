#!/usr/bin/env raku

grammar Math {
  rule TOP { ^ <expr> $ };
  rule expr { <number> | <parens> | <operation> };
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
);

for @examples {
  if Math.parse($_) {
    say $/
  } else {
    note "Parse error: $_"
  }
}
