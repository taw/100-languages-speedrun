fun main() {
  val alist = listOf(1, 2, 3, 4, 5)

  println(alist.map{ x -> x * 2 })
  println(alist.map{ it * 2 })
  println(alist.filter{ it % 2 == 1 })
  println(alist.reduce{ a, b -> a + b })
}
