#!/usr/bin/env ruby

require_relative "tuples"

Tuples.run do
  # Initial state
  tuple 1, 1, 19
  # Generate data
  rule(1, :a, :b) { [1, a+1, b-1] }

  # Send it to digit splitter
  rule(1, :a, :b) { [2, a, a, 0, 0] }

  # Split digits, send to r<10 filter
  rule(2, :i, :a, :d, :r) { [2, i, a-1, d, r+1] }
  rule(2, :i, :a, :d, 10) { [2, i, a, d+1, 0] }
  rule(2, :i, 0, :d, :r) { [3, i, d, r, r, 9] }

  # m<10 filter
  rule(3, :i, :d, :r, :ra, :rb) { [3, i, d, r, ra-1, rb-1] }
  rule(3, :i, :d, :r, 0, :rb) { [4, i, 0, 0, d, r] }

  # OK, we split the number and we're ready to print
  # Multiply i by 3 to get final position, then send to three printers
  rule(4, :i, :ia, 0, :r, :m) { [4, i-1, ia, 3, r, m] }
  rule(4, :i, :ia, :ib, :r, :m) { [4, i, ia+1, ib-1, r, m] }
  rule(4, 0, :ia, 0, :r, :m) { [10, ia, r, r-1] }
  rule(4, 0, :ia, 0, :r, :m) { [20, ia+1, m] }
  rule(4, 0, :ia, 0, :r, :m) { [30, ia+1] }

  # First digit printer, needs additional check arguments to filter out zeroes
  rule(10, :i, :d, :z) { [11, i, d, 48] }
  rule(11, :i, :a, :b) { [11, i, a+1, b-1] }
  rule(11, :i, :a, 0) { [0, 1, i, a] }

  # Second digit printer
  rule(20, :i, :d) { [21, i, d, 48] }
  rule(21, :i, :a, :b) { [21, i, a+1, b-1] }
  rule(21, :i, :a, 0) { [0, 1, i, a] }

  # Newline printer
  rule(30, :i) { [0, 1, i+1, 10] }
end
