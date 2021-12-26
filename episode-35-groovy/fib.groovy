def fib(n) {
  if (n <= 2) {
    1
  } else {
    fib(n - 1) + fib(n - 2)
  }
}

for (i in 1..30) {
  println("fib(${i}) = ${fib(i)}")
}
