#!/usr/local/opt/tcl-tk/bin/tclsh

set x 2
set y "4"
set z [expr $x+$y]
puts [string toupper Hello]
puts [string tolower "World"]
puts "$x + $y = $z"
puts {$x + $y = $z}
puts stdout hello
