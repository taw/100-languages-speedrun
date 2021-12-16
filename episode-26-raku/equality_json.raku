#!/usr/bin/env raku

use JSON::Tiny;

sub json-equal($a, $b) {
  to-json($a) eq to-json($b)
}

# True as expected
say json-equal([1, 2], [1, 2]);

# False as expected
say json-equal([1, 2], "[1, 2]");
say json-equal("2", "2.0");

# Also True...
say json-equal(5, 5.0);
say json-equal(0, -0);

# Also False...
say json-equal(1, "1");

# Totally random if True or False
say json-equal({b=>2, a=>1}, {a=>1, b=>2});
