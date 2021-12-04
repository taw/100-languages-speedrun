#!/usr/bin/awk -f

/[13579]$/ { print | "tac" }
