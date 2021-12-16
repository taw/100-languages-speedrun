#!/usr/bin/env raku

say "What's your name?";
my $name = get;

if ($name eq "admin" | "root") {
  say "Don't try to hack me"
} else {
  say "Hello, $name";
}
