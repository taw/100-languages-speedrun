trait Additive[T] {
  def plus(x: T, y: T): T
}

implicit object AdditiveInt extends Additive[Int] {
  def plus(x: Int, y: Int): Int = x + y
}

implicit object AdditiveDouble extends Additive[Double] {
  def plus(x: Double, y: Double): Double = x + y
}

implicit object AdditiveString extends Additive[String] {
  def plus(x: String, y: String): String = x + y
}

def add[T](a : T, b : T)(implicit additive: Additive[T]) = {
  println(s"${a} + ${b} = ${additive.plus(a, b)}")
}

add(6, 0.9)
add(400, 20)
add("foo", "bar")
