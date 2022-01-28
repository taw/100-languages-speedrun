#!/Applications/factor/factor

USING: io math math.parser kernel ;

1
[                ! 1
  dup            ! 1 1
  number>string  ! 1 "1"
  print          ! 1
  1              ! 1 1
  +              ! 2
  dup            ! 2 2
  10             ! 2 2 10
  <=             ! 2 t
]
loop
drop
