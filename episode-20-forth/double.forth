#! /usr/local/bin/gforth

( Function to double a number )

: double
  dup +
;

21 double .
cr bye
