#!/usr/bin/env ruby

require_relative "tuples"

Tuples.run do
  # Initial state
  # There's a lot of countdown counters here
  tuple 1, 0, 0, 9, 0, 0, 0, 100

  # cnt -= 1
  rule(1, :i1, :i0, :ic, :fcnt, :bcnt, :pos, :cnt) { [2, i1, i0, ic, fcnt, bcnt, pos, 10, cnt-1] }

  # loop to do pos += 10
  rule(2, :i1, :i0, :ic, :fcnt, :bcnt, :pos, :posplus, :cnt) { [2, i1, i0, ic, fcnt, bcnt, pos+1, posplus-1, cnt] }
  rule(2, :i1, :i0, :ic, :fcnt, :bcnt, :pos, 0, :cnt) { [3, i1, i0, ic, fcnt, bcnt, pos, cnt] }

  # update i1, i0, and ic
  # i0 - lowest digit
  # i1 - highest digit
  # ic + i0 == 9 always
  rule(3, :i1, :i0, 0, :fcnt, :bcnt, :pos, :cnt) { [4, i1+1, 0, 9, fcnt, bcnt, pos, cnt] }
  rule(3, :i1, :i0, :ic, :fcnt, :bcnt, :pos, :cnt) { [4, i1, i0+1, ic-1, fcnt, bcnt, pos, cnt] }

  # update fizz countdown
  rule(4, :i1, :i0, :ic, :fcnt, :bcnt, :pos, :cnt) { [5, i1, i0, ic, fcnt-1, bcnt, pos, cnt] }
  rule(4, :i1, :i0, :ic, 0, :bcnt, :pos, :cnt) { [5, i1, i0, ic, 2, bcnt, pos, cnt] }

  # update buzz countdown
  rule(5, :i1, :i0, :ic, :fcnt, :bcnt, :pos, :cnt) { [6, i1, i0, ic, fcnt, bcnt-1, pos, cnt] }
  rule(5, :i1, :i0, :ic, :fcnt, 0, :pos, :cnt) { [6, i1, i0, ic, fcnt, 4, pos, cnt] }

  # decide what to print based on counters
  rule(6, :i1, :i0, :ic, 0, :bcnt, :pos, :cnt) { [10, pos] }
  rule(6, :i1, :i0, :ic, :fcnt, 0, :pos, :cnt) { [11, pos] }
  rule(6, :i1, :i0, :ic, :fcnt, :bcnt, :pos, :cnt) { [12, fcnt-1, bcnt-1, i1, i0, pos] }
  rule(6, :i1, :i0, :ic, :fcnt, :bcnt, :pos, :cnt) { [13, pos] }

  # continue the loop
  rule(6, :i1, :i0, :ic, :fcnt, :bcnt, :pos, :cnt) { [1, i1, i0, ic, fcnt, bcnt, pos, cnt] }

  # print fizz
  rule(10, :pos) { [20, pos, 0, 70] }
  rule(10, :pos) { [20, pos, 1, 105] }
  rule(10, :pos) { [20, pos, 2, 122] }
  rule(10, :pos) { [20, pos, 3, 122] }

  # print buzz
  rule(11, :pos) { [20, pos, 4, 66] }
  rule(11, :pos) { [20, pos, 5, 117] }
  rule(11, :pos) { [20, pos, 6, 122] }
  rule(11, :pos) { [20, pos, 7, 122] }

  # print number
  rule(12, :fcheck, :bcheck, :i1, :i0, :pos) { [14, i1-1, pos, i1] }
  rule(12, :fcheck, :bcheck, :i1, :i0, :pos) { [14, 0, pos+1, i0] }

  # print newline
  rule(13, :pos) { [20, pos, 8, 10] }

  # digit print check
  rule(14, :dcheck, :pos, :c) { [15, pos, c, 48] }

  # convert digit to ASCII
  rule(15, :pos, :c, :cplus) { [15, pos, c+1, cplus-1] }
  rule(15, :pos, :c, 0) { [0, 1, pos, c] }

  # print character at specific offset
  rule(20, :pos, :posplus, :c) { [20, pos+1, posplus-1, c] }
  rule(20, :pos, 0, :c) { [0, 1, pos, c] }
end

