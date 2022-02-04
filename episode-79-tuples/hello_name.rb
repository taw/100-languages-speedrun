#!/usr/bin/env ruby

require_relative "tuples"

Tuples.run(input: true) do
  tuple 0, 1, 0, 72
  tuple 0, 1, 1, 101
  tuple 0, 1, 2, 108
  tuple 0, 1, 3, 108
  tuple 0, 1, 4, 111
  tuple 0, 1, 5, 44
  tuple 0, 1, 6, 32
  rule(0, 0, :a, :b) { [2, b-11, 100+a, b] }
  rule(2, :a, :b, :c) { [0, 1, b, c] }
  tuple 0, 1, 200, 33
  tuple 0, 1, 201, 10
end
