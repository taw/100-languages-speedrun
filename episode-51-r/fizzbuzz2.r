#!/usr/bin/env Rscript

i = seq(1, 100)
x = i
x[i %% 3 == 0] = "Fizz"
x[i %% 5 == 0] = "Buzz"
x[i %% 15 == 0] = "FizzBuzz"
cat(x, sep="\n")
