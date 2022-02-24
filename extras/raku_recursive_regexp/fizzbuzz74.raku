#!/usr/bin/env raku

sub fizzbuzz74($n) {
  given $n {
    when $_ % 4 == 0 && $_ % 7 == 0 { "FizzBuzz" }
    when $_ % 4 == 0 { "Fizz" }
    when $_ % 7 == 0 { "Buzz" }
    default { $_ }
  }
}

for 0..1_000_000 {
  say fizzbuzz74($_)
}
