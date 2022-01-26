#!/usr/bin/env io

assert := method(comparison,
  (comparison) ifFalse(
    code := call message argAt(0)
    "This code failed: #{code}" interpolate println
  )
)

# Io uses normal math
assert(2 + 2 * 2 == 6)
assert(2 + 2 * 2 > 5)
assert(6 == 2 + 2 * 2)

# Io does not use Smalltalk math
assert(2 + 2 * 2 == 8)
assert(2 + 2 * 2 > 7)
assert(8 == 2 + 2 * 2)
