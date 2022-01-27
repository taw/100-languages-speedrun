#!/usr/bin/env ioke

use("Point")

a = Point mimic
a x = 20
a y = 60

b = Point mimic do(
  x = 400
  y = 9)

(a + b) println
