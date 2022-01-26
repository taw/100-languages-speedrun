#!/usr/bin/env io

squareBrackets := method(
  result := list()
  call message arguments foreach(item, result append(doMessage(item)))
  return result
)

array := [1, 2, 3+4, ["foo", "bar"]]
array asJson println
