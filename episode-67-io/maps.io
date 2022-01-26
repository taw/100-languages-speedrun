#!/usr/bin/env io

a := Map clone
a atPut("name", "Alice")
a atPut("last_name", "Smith")
a atPut("age", 25)

"""#{a at("name")} #{a at("last_name")} is #{a at("age")} years old""" interpolate println
a println
a asJson println
