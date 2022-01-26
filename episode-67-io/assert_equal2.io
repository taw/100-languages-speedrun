#!/usr/bin/env io

assertEqual := method(left, right,
  (left == right) ifFalse(
    leftExpr := call message argAt(0) asString
    rightExpr := call message argAt(1) asString
    "assertion failed:\n  #{leftExpr} # => #{left}\ndoes not equal\n  #{rightExpr} # => #{right}" interpolate println
  )
)

# Ascii works
assertEqual("hello" asUppercase, "HELLO")
# Sadly no Unicode
assertEqual("żółw" asUppercase, "ŻÓŁW")
