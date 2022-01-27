#!/usr/bin/env ioke

Point = Origin mimic do(
  asText = method("<#{x},#{y}>")
  + = method(other, Point with(x: self x + other x, y: self y + other y)))

a = Point with(x: 20, y: 60)
b = Point with(x: 400, y: 9)
(a + b) println
