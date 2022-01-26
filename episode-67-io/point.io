#!/usr/bin/env io

Point := Object clone
Point x := 0
Point y := 0
Point + := method(other,
  result := self clone
  result x := self x + other x
  result y := self y + other y
  return result
)
Point asString := method(return "Point(#{self x}, #{self y})" interpolate)

a := Point clone
a x := 60
a y := 400

b := Point clone do(
  x := 9
  y := 20
)

a println
b println
(a + b) println

"Slots of Object prototype: #{Object slotNames}" interpolate println
"Slots of Point prototype: #{Point slotNames}" interpolate println
"Slots of individual point: #{a slotNames}" interpolate println
