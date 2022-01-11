#!/usr/bin/perl

# $\ specifies what gets printed at the end of print automatically
$\ = "\n";

# If we don't specify any variable, Perl will use topic variable $_
for (1..100) {
  if ($_ % 3 == 0 && $_ % 5 == 0) {
    print "FizzBuzz"
  } elsif ($_ % 3 == 0) {
    print "Fizz"
  } elsif ($_ % 5 == 0) {
    print "Buzz"
  } else {
    # print also defaults to printing topic variable
    # (followed by $\ as always)
    print
  }
}
