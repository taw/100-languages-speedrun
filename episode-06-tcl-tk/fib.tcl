#!/usr/local/opt/tcl-tk/bin/tclsh

proc fib n {
  if { $n <= 2 } {
    return 1
  } else {
    return [expr [fib [expr $n-1]] + [fib [expr $n-2]]]
  }
}

for {set i 1} {$i <= 30} {incr i} {
  puts [fib $i]
}
