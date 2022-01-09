#!/usr/bin/env Rscript

fib = function(n) {
  if (n <= 2) {
    1
  } else {
    fib(n - 1) + fib(n - 2)
  }
}

for (i in seq(1, 20)) {
  cat("fib(", i, ") = ", fib(i), "\n", sep="")
}
