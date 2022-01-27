#!/usr/bin/env ioke

a = [1, 2, 3, 4, 5]

a map(x, x * 2) println
a select(x, x % 2 == 0) println
a reduce(x, y, x + y) println
a at(0) println
a at(-1) println
a[3] println
