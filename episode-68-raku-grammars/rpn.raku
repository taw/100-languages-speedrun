#!/usr/bin/env raku

grammar RPN {
  rule TOP { ^ <tok>* $ };
  rule tok { <number> | <op> };
  regex number { "-"? <[0..9]>+ ["." <[0..9]>*]? };
  regex op { "+" | "-" | "*" | "/" | "in" | "out" };
}

class RPNActions {
  method TOP($/) { make [$<tok>.map(*.made)] }
  method tok($/) { make $<number> ?? $<number>.made !! $<op>.made }
  method number($/) { make {type => "number", value => +$/.Str} }
  method op($/) { make {type => $/.Str} }
}

sub run($m) {
  my @stack = ();
  for @$m {
    my $type = $_{'type'};
    my $value = $_{'value'};
    given $type {
      when "number" { @stack.push($value) }
      when "in" { @stack.push(+$*IN.get) }
      when "/" { my $a = @stack.pop; my $b = @stack.pop; @stack.push($b / $a) }
      when "*" { my $a = @stack.pop; my $b = @stack.pop; @stack.push($b * $a) }
      when "+" { my $a = @stack.pop; my $b = @stack.pop; @stack.push($b + $a) }
      when "-" { my $a = @stack.pop; my $b = @stack.pop; @stack.push($b - $a) }
      when "out" { say @stack.pop }
      default { die "Unknown operator $type" }
    }
  }
}

unless @*ARGS == 1 {
  note "Usage: $*PROGRAM-NAME <file.rpn>";
  exit 1;
}
my $path = @*ARGS[0];

if RPN.parsefile($path, actions => RPNActions) {
  run $/.made
} else {
  note "Parse error";
}
