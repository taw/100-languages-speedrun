import groovy.transform.ToString
import groovy.transform.EqualsAndHashCode

@EqualsAndHashCode
@ToString(includeNames=true)
class Point {
  Double x
  Double y

  def length() {
    Math.sqrt(x * x + y * y)
  }
}

a = [1, 2, 3]
b = [1, 2, 3]
c = new Point(x: 30.0, y: 40.0)
d = new Point(x: 30.0, y: 40.0)

println(a == b)
println(c == d)
println(null == d)
println("len of ${c} is ${c.length()}")
