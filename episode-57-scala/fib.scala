def fib(n : Int) : Int = {
  if (n <= 2) {
    1
  } else {
    fib(n - 1) + fib(n - 2)
  }
}

for (n <- 1 to 20) {
  println(s"fib($n) = ${fib(n)}")
}
