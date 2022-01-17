val alist = List(1, 2, 3, 4, 5)

println(alist.map{ x => x * 2 })
println(alist.map{ _ * 2 })
println(alist.filter{ _ % 2 == 1 })
println(alist.reduce{ (a, b) => a + b })
