#!/usr/bin/env gst

Number extend [
  fib [
    ^ (self <= 2)
      ifTrue: [1]
      ifFalse: [(self - 1) fib + (self - 2) fib]
  ]
]

(1 to: 20) do: [:i |
  Transcript
    display: 'fib(';
    display: i;
    display: ') = ';
    display: i fib;
    cr
].
