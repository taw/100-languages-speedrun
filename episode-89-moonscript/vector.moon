#!/usr/bin/env moon

class Vector
  new: (@x, @y) =>
  __tostring: => "<#{@x},#{@y}>"
  __add: (other) => Vector(@x + other.x, @y + other.y)
  __eq: (other) =>
    @__class == other.__class and @x == other.x and @y == other.y

a = Vector(20, 60)
b = Vector(400, 9)
c = a + b

print a
print b
print c
print c == Vector(420, 69)
