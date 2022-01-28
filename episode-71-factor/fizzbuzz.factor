#!/Applications/factor/factor

USING: io math math.parser kernel ;
IN: fizzbuzz

: is-fizz ( n -- t/f )
  3       ! N 3
  mod     ! N%3
  0       ! N%3 0
  =       ! t/f
;
: is-buzz ( n -- t/f )
  5       ! N 5
  mod     ! N%5
  0       ! N%5 0
  =       ! t/f
;

: fizzbuzz ( n -- str )
  dup                 ! N N
  is-fizz             ! N isFizz
  [                   ! N
    is-buzz           ! isBuzz
    [ "FizzBuzz" ]    ! "FizzBuzz"
    [ "Fizz" ]        ! "Fizz"
    if
  ]
  [
    dup               ! N N
    is-buzz           ! N isBuzz
    [ drop "Buzz" ]   ! "Buzz"
    [ number>string ] ! "N"
    if
  ]
  if
;

! does not remove top of the stack
: print-fizzbuzz ( n -- n )
  dup fizzbuzz print
;

1
[
  print-fizzbuzz
  1 +
  dup 100 <=
]
loop
drop
