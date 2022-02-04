#!/usr/bin/env ruby

require_relative "tuples"

Tuples.run do
  # Initial state
  tuple 1, 1, 9
  # Generate data
  rule(1, :a, :b) { [1, a+1, b-1]}

  # Generate output, number to string conversion
  # But send it to extra stage so we can filter the parts we don't want
  # if second arg is negative, it won't get added to the state
  rule(1, :a, :b) { [2, (a/10)-1, 10*a+0, 48+(a/10)] }
  rule(1, :a, :b) { [2, 0, 10*a+1, 48+(a%10)] }
  rule(1, :a, :b) { [2, 0, 10*a+2, 10] }

  # Filtering is done, output the result
  rule(2, :a, :b, :c) { [0, 1, b, c] }
end
