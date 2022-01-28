#!/usr/bin/env wren_cli

class Point {
  x { _x }
  y { _y }
  construct new(x,y) {
    _x = x
    _y = y
  }
  toString { "Point(%(_x), %(_y))" }
  +(other) { Point.new(_x + other.x, _y + other.y) }
  ==(other) { other.type == Point && x == other.x && y == other.y }
}

var a = Point.new(400, 60)
var b = Point.new(20, 9)
var c = a + b
var d = Point.new(420, 69)

System.print(a)
System.print(b)
System.print(c)

System.print(c == null)
System.print(c == d)
System.print(c != d)
