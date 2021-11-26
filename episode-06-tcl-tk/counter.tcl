#!/usr/local/opt/tcl-tk/bin/wish

set counter 0
proc plus_one args {
  global counter
  incr counter
}
proc minus_one args {
  global counter
  set counter [expr $counter-1]
}

wm geometry . 800x600
label .counter -textvariable counter -font "Helvetica -64"
button .plus -text "+1" -command plus_one -font "Helvetica -48"
button .minus -text "-1" -command minus_one -font "Helvetica -48"

place .counter -x 400 -y 200 -anchor s
place .minus -x 400 -y 300 -anchor e
place .plus -x 400 -y 300 -anchor w
