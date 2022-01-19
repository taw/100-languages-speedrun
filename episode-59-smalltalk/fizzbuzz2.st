#!/usr/bin/env gst -g

"FizzBuzz in Smalltalk"

Number extend [
  isMultipleOf: n [
    ^ (self rem: n) = 0
  ]
]

(1 to: 100) do: [:i |
  Transcript
    display: (
      (i isMultipleOf: 3) ifTrue: [
        (i isMultipleOf: 5)
          ifTrue: ['FizzBuzz']
          ifFalse: ['Fizz']
      ] ifFalse: [
        (i isMultipleOf: 5)
          ifTrue: [ 'Buzz' ]
          ifFalse: [ i ]
      ]
    );
    cr.
].
