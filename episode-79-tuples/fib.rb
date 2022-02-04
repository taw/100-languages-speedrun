#!/usr/bin/env ruby

require_relative "tuples"

Tuples.run do
  # Initial state
  tuple 10, 1, 1, 1, 99
  # Generate data
  rule(10, :i, :a, :b, :cnt) { [10, i+1, b, a+b, cnt-1]}
  # print "fib(",  ")=", and "\n" parts
  rule(10, :i, :a, :b, :cnt) { [0, 1, 1000*i + 0, 102] }
  rule(10, :i, :a, :b, :cnt) { [0, 1, 1000*i + 1, 105] }
  rule(10, :i, :a, :b, :cnt) { [0, 1, 1000*i + 2, 98] }
  rule(10, :i, :a, :b, :cnt) { [0, 1, 1000*i + 3, 40] }
  rule(10, :i, :a, :b, :cnt) { [0, 1, 1000*i + 200, 41] }
  rule(10, :i, :a, :b, :cnt) { [0, 1, 1000*i + 201, 61] }
  rule(10, :i, :a, :b, :cnt) { [0, 1, 1000*i + 401, 10] }

  # Send i and fib(i) to conversion function to output at the right places
  rule(10, :i, :a, :b, :cnt) { [11, 1000*i + 199, i] }
  rule(10, :i, :a, :b, :cnt) { [11, 1000*i + 399, a] }

  # Convert string to number and output it
  rule(11, :i, :n) { [0, 1, i, 48+(n%10)] }
  rule(11, :i, :n) { [12, (n/10)-1, i-1, n/10] }
  rule(12, :_, :i, :n) { [11, i, n] }
end
