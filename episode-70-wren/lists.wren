#!/usr/bin/env wren_cli

var a = [1, 2, 3, 4, 5]

System.print([1, 2, 3])
System.print(1..3)
System.print(a.map{|i| i*2})
System.print(a.map{|i| i*2}.toList)
System.print(a.where{|i| i%2 == 1}.toList)
System.print(a.reduce{|i,j| i+j})

System.print(a == a)
System.print([] == [])
