#!/usr/bin/awk -f

/[13579]$/ { print >"odd.txt" }
/[02468]$/ { print >"even.txt" }
