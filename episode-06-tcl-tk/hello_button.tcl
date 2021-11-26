#!/usr/local/opt/tcl-tk/bin/wish

wm geometry . 800x600
button .hello -text "Hello, World!" -command { exit }
pack .hello
