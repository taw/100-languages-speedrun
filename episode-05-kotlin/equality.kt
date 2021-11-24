data class Point(val x: Double, val y: Double) {
  fun length() = Math.sqrt(x * x + y * y)
}

fun main() {
  val a = listOf(1, 2, 3)
  val b = listOf(1, 2, 3)
  val c = Point(30.0, 40.0)
  val d = Point(30.0, 40.0)

  println(a == b)
  println(c == d)
  println(null == d)
  println("len of ${c} is ${c.length()}")
}
