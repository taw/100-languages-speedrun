#!/usr/bin/env octave

u = [1,1];
m = [1 1; 1 0];

for i = 1:40
  result = dot(u * (m**(i-1)), [0 1]);
  printf("fib(%d) = %d\n", i, result);
endfor
