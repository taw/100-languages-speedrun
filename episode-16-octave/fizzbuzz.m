#!/usr/bin/env octave

vector = 1:100
indexes = 1 + !mod(vector, 3) + 2*!mod(vector, 5)

for i=vector
  o = {i, "Fizz", "Buzz", "FizzBuzz"};
  ai = indexes(i);
  disp(o{ai})
endfor
