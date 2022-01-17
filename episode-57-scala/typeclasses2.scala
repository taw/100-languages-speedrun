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

case class Point[T](x : T, y : T)(implicit additive: Additive[T]) {
  def +(other : Point[T]) = {
    Point(additive.plus(x, other.x), additive.plus(y, other.y))
  }
}

implicit def AdditivePoint[T] : Additive[Point[T]] = {
  new Additive[Point[T]] {
    def plus(x: Point[T], y: Point[T]): Point[T] = x + y
  }
}

def add[T](a : T, b : T)(implicit additive: Additive[T]) = {
  println(s"${a} + ${b} = ${additive.plus(a, b)}")
}

println(Point(1, 2) + Point(3, 4))
add(Point(300, 60), Point(120, 9))
add(Point(6.0, 250.0), Point(0.9, 170.0))
add(Point("foo", "much"), Point("bar", "wow"))
