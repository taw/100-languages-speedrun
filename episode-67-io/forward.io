#!/usr/bin/env io

Cat := Object clone
Cat meow := method("Meow!" println)
Cat asString := "I'm a Kitty!"

Spy := Object clone
Spy object := Cat
Spy forward := method(
  m := call message name
  args := call message arguments
  "Someone's trying to ask #{object} to #{m} with #{args}" interpolate println
  object doMessage(call message))

Cat meow
Spy meow
