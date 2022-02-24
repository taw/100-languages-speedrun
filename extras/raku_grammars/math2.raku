#!/usr/bin/env raku

grammar Math {
  rule TOP { ^ <expr> $ };

  proto token expr {*};
  token expr:sym<value> { <value> };
  token expr:sym<operation> { <value> <op> <value> };

  proto token value {*};
  token value:sym<number> { <number> };
  token value:sym<parens> { <parens> };

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
  "2 + 3",
  "2 + 3 + 4",
);

for @examples {
  if Math.parse($_) {
    say $/
  } else {
    note "Parse error: $_"
  }
}
