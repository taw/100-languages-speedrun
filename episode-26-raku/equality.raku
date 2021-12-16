#!/usr/bin/env raku

# Numerical
say 2 + 2 == 4;
say 2 == "2.0";

# String equality
say "hello" eq "hello";

# Looks like it works...
say [1, 2] eq [1, 2];
# Raku sorts the key order (unlike Ruby) so they match
say {b=>2, a=>1} eq {a=>1, b=>2};

# WTF? How is any of these True?
say ["one", "two"] eq "one two";
say [1, 2] eq ["1 2"];
say [1, 2] eq "1 2";
say {a=>1} eq "a\t1";
say {a=>1, b=>2} eq "a\t1\nb\t2";
