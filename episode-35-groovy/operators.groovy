import groovy.transform.*

@EqualsAndHashCode
@ToString
class Point {
  Double x
  Double y

  def length() {
    Math.sqrt(x * x + y * y)
  }

  def plus(other) {
    new Point(x: x + other.x, y: y + other.y)
  }
}

a = new Point(x: 10, y: 40)
b = new Point(x: 20, y: -20)

println("${a} + ${b} == ${a+b}")
