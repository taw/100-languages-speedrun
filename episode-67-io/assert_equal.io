#!/usr/bin/env io

assertEqual := method(left, right,
  (left == right) ifFalse(
    leftExpr := call message argAt(0) asString
    rightExpr := call message argAt(1) asString
    "assertion failed:\n  #{leftExpr} # => #{left}\ndoes not equal\n  #{rightExpr} # => #{right}" interpolate println
  )
)

# Io uses normal math
assertEqual(2 + 2 * 2, 6)
# Io does not use Smalltalk math
assertEqual(2 + 2 * 2, 8)
