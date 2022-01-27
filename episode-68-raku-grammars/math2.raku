#!/usr/bin/env raku

grammar Math {
  rule TOP { ^ <expr> $ };
  rule expr { <value> + % <op> };
  rule value { <parens> | <number> };
  rule parens { "(" <expr> ")" };
  regex number { "-"? <[0..9]>+ ["." <[0..9]>*]? };
  regex op { "+" };
};

my @examples = (
  "100",
  "-4.20",
  "((5))",
  "2+3",
  "(2+3)",
  "2+3+4",
);

for @examples {
  if Math.parse($_) {
    say $/
  } else {
    note "Parse error: $_"
  }
}
