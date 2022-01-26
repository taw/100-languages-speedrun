#!/usr/bin/env io

Number fib := method((self-2) fib + (self-1) fib)
1 fib := method(1)
2 fib := method(1)

for(i, 1, 30, "fib(#{i}) = #{i fib}" interpolate println)
