#!/usr/bin/env io

Point := Object clone do(
  x ::= 0
  y ::= 0
  with := method(xval,yval,self clone setX(xval) setY(yval))
  asString := method(return "Point(#{self x}, #{self y})" interpolate)
  + := method(other, return self with(x + other x, y + other y))
)

a := Point with(60, 400)
b := Point with(9, 20)
(a+b) println
