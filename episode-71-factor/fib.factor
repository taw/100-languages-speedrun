#!/Applications/factor/factor

USING: io math math.parser kernel ;
IN: fib

: fib ( n -- m )
  dup          ! N N
  2 <=         ! N t/f
  ! called if <= 2
  [             ! N
    drop        ! empty
    1           ! 1
  ]
  ! called if > 2
  [             ! N
    dup         ! N N
    1 -         ! N N-1
    fib         ! N fib(N-1)
    swap        ! fib(N-1) N
    2 -         ! fib(N-1) N-2
    fib         ! fib(N-1) fib(N-2)
    +           ! fib(N-1) + fib(N-2)
  ]
  if
;

! does not remove top of the stack
: print-fib ( n -- n )
  "fib(" write
  dup number>string write
  ") = " write
  dup fib number>string write
  "\n" write
;

1
[
  print-fib
  1 +
  dup 20 <=
]
loop
drop
