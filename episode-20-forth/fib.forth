#! /usr/local/bin/gforth

: fib recursive
  dup 2 <= if
    drop
    1
  else
    dup 1 - fib
    swap
    2 - fib
    +
  endif
;

20 fib . cr
bye
