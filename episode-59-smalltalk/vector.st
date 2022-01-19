#!/usr/bin/env gst

Object subclass: Vector [
  | x y |
  x: xVal [ x := xVal ]
  y: yVal [ y := yVal ]
  x [ ^x ]
  y [ ^y ]

  Vector class >> x: xVal y: yVal [
    ^(self new)
      x: xVal;
      y: yVal;
      yourself.
  ]
  printOn: stream [
    stream nextPutAll: '<'.
    x printOn: stream.
    stream nextPutAll: ','.
    y printOn: stream.
    stream nextPutAll: '>'.
  ]
  + other [
    ^ Vector
      x: self x + other x
      y: self y + other y
  ]
].

a := Vector x: 60 y: 230.
b := Vector x: 9 y: 190.
c := Vector new.

Transcript
  display: a; cr;
  display: b; cr;
  display: c; cr;
  display: a + b; cr.
