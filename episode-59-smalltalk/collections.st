#!/usr/bin/env gst

"Array literal syntax"
a := #(1 2 3 4 5).

"Arrays are fixed size"
b := Array new: 5.
b
  at: 1 put: 10;
  at: 2 put: 20;
  at: 3 put: 30;
  at: 4 put: 40;
  at: 5 put: 50.

Transcript
  display: a; cr;
  display: b; cr;
  display: (a collect: [:x | x * 2]); cr;
  display: (a select: [:x | (x rem: 2) = 1]); cr;
  display: (a inject: 0 into: [:x :y | x + y]); cr.
