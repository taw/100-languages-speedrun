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

  rule(0, 0, :i, :c) { [1, c, 11, i, 7, c] }
  # 1.* filters out 0s and NLs
  rule(1, :cx, :cy, :i, :ip, :c) { [1, cx-1, cy-1, i, ip, c] }
  rule(1, :cx, 0, :i, :ip, :c) { [2, i, ip, c] }
  # 2.* adds ip to i
  rule(2, :i, :ip, :c) { [2, i+1, ip-1, c] }
  rule(2, :i, 0, :c) { [0, 1, i, c] }

  tuple 0, 1, 200, 33
  tuple 0, 1, 201, 10
end
