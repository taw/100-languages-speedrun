#!/usr/bin/env ruby

require_relative "tuples"

Tuples.run do
  # Initial state
  tuple 1, 1, 99
  # Generate data
  rule(1, :a, :b) { [1, a+1, b-1]}

  # Print all "\n"s
  rule(1, :i, :_) { [0, 1, 1000*i + 100, 10] }

  # Decide which print function to call
  rule(1, :i, :a) { [20, (i%3)-1, (i%5)-1, i] }
  rule(1, :i, :a) { [21, -(i%3), (i%5)-1, i] }
  rule(1, :i, :a) { [22, (i%3)-1, -(i%5), i] }
  rule(1, :i, :a) { [23, -(i%3), -(i%5), i] }

  # Print number
  rule(20, :a, :b, :i) { [11, 1000*i + 99, i] }

  # Print Fizz
  rule(21, :a, :b, :i) { [0, 1, 1000*i + 0, 70] }
  rule(21, :a, :b, :i) { [0, 1, 1000*i + 1, 105] }
  rule(21, :a, :b, :i) { [0, 1, 1000*i + 2, 122] }
  rule(21, :a, :b, :i) { [0, 1, 1000*i + 3, 122] }

  # Print Buzz
  rule(22, :a, :b, :i) { [0, 1, 1000*i + 0, 66] }
  rule(22, :a, :b, :i) { [0, 1, 1000*i + 1, 117] }
  rule(22, :a, :b, :i) { [0, 1, 1000*i + 2, 122] }
  rule(22, :a, :b, :i) { [0, 1, 1000*i + 3, 122] }

  # Print FizzBuzz
  rule(23, :a, :b, :i) { [0, 1, 1000*i + 0, 70] }
  rule(23, :a, :b, :i) { [0, 1, 1000*i + 1, 105] }
  rule(23, :a, :b, :i) { [0, 1, 1000*i + 2, 122] }
  rule(23, :a, :b, :i) { [0, 1, 1000*i + 3, 122] }
  rule(23, :a, :b, :i) { [0, 1, 1000*i + 5, 66] }
  rule(23, :a, :b, :i) { [0, 1, 1000*i + 6, 117] }
  rule(23, :a, :b, :i) { [0, 1, 1000*i + 7, 122] }
  rule(23, :a, :b, :i) { [0, 1, 1000*i + 8, 122] }

  # Convert string to number and output it
  rule(11, :i, :n) { [0, 1, i, 48+(n%10)] }
  rule(11, :i, :n) { [12, (n/10)-1, i-1, n/10] }
  rule(12, :_, :i, :n) { [11, i, n] }
end
