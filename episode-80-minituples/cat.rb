#!/usr/bin/env ruby

require_relative "tuples"

Tuples.run(input: true) do
  rule(0, 0, :i, :c) { [1, c-1, i, c] }
  rule(1, :_, :i, :c) { [0, 1, i, c] }
end
