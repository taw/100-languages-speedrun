case class Point(x : Double, y : Double) {
  def length() = Math.sqrt(x * x + y * y)
}

val a = List(1, 2, 3)
val b = List(1, 2, 3)
val c = Point(30.0, 40.0)
val d = Point(30.0, 40.0)

println(a == b)
println(c == d)
println(null == d)
println(s"len of ${c} is ${c.length()}")
