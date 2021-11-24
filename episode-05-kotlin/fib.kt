fun fib(n: Int): Int {
  if (n < 3) {
    return 1
  } else {
    return fib(n - 1) + fib(n - 2)
  }
}

fun main() {
  for (i in 1..30) {
    println(fib(i))
  }
}
