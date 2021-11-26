#!/usr/local/opt/tcl-tk/bin/tclsh

proc fizzbuzz n {
  if { $n % 15 == 0 } {
    return "FizzBuzz"
  } elseif { $n % 3 == 0 } {
    return "Fizz"
  } elseif { $n % 5 == 0 } {
    return "Buzz"
  } else {
    return $n
  }
}

for {set i 1} {$i <= 100} {incr i} {
  puts [fizzbuzz $i]
}
