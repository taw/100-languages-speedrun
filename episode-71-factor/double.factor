#!/Applications/factor/factor

USING: io math math.parser kernel ;
IN: double

: double-number ( n -- m ) 2 * ;

200
[                ! 200
  dup            ! 200 200
  double-number  ! 200 400
  number>string  ! 200 "400"
  print          ! 200
  1              ! 200 1
  +              ! 201
  dup            ! 201 201
  210            ! 201 201 210
  <=             ! 201 t
]
loop
drop
