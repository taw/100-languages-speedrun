#!/usr/bin/env moon

class Person
  new: (@name, @surname, @age) =>
  __tostring: =>
    "#{@name} #{@surname}"

maria = Person("Maria", "Ivanova", 25)
print "#{maria} is #{maria.age} years old"
