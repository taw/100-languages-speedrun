#!/bin/tcsh

set num = $argv[1]
if (( $num  <= 2 )) then
  echo 1
else
  @ a = $num - 1
  @ b = $num - 2
  set c = `./fib.tcsh $a`
  set d = `./fib.tcsh $b`
  @ e = $c + $d
  echo $e
endif
