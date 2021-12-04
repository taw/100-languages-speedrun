#!/usr/bin/awk -f

BEGIN { x = 0 }
/[0-9]+/ { x += $1 }
END { print x }
