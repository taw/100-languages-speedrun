#!/usr/bin/env Rscript

suppressPackageStartupMessages(require(matrixcalc))

fib = function(n) {
  m = matrix(c(1,1,1,0), ncol=2)
  matrix.power(m, n)[1,2]
}

for (i in seq(1, 20)) {
  cat("fib(", i, ") = ", fib(i), "\n", sep="")
}
