#!/usr/bin/env raku

# True as expected
say [1, 2] eqv [1, 2];
say {b=>2, a=>1} eqv {a=>1, b=>2};

# This is still True
say 0 eqv -0;

# False as expected
say [1, 2] eqv "[1, 2]";
say "2" eqv "2.0";

# Now this is False too?
say 5 eqv 5.0;
say 1 eqv "1";
