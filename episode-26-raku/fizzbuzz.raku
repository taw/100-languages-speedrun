#!/usr/bin/env raku

sub fizzbuzz($n) {
  given $n {
    when $_ % 3 == 0 && $_ % 5 == 0 { "FizzBuzz" }
    when $_ % 3 == 0 { "Fizz" }
    when $_ % 5 == 0 { "Buzz" }
    default { $_ }
  }
}

for 1..100 {
  say fizzbuzz($_)
}
