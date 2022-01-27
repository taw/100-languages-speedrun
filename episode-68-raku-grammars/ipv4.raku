#!/usr/bin/env raku

my regex digit { <[0..9]> };
my regex nonzero_digit { <[1..9]> };
my regex byte {
  [
  | <digit>                 # 0-9
  | <nonzero_digit> <digit> # 10-99
  | 1 <digit> <digit>       # 100-199
  | 2 <[0..4]> <digit>      # 200-249
  | 25 <[0..5]>             # 250-255
  ]
};
my regex ipv4 { ^ <byte> ** 4 % "." $ };

my @examples = (
  "1.2.3.4",
  "127.0.0.1",
  "100.200.300.400",
  "02.03.04.05",
  "1.2.3.4.5",
  "it's a kitty!",
  "69.420.69.420",
  "10.20.30.40 ",
  "127.0.0.1.",
  "๓.๓.๓.๓", # \d bug still there
);
for @examples {
  say "VALID: '$_'" if $_ ~~ &ipv4;
  say "NOT VALID: '$_'" if $_ !~~ &ipv4;
}
