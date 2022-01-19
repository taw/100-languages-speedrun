#!/usr/bin/env gst

"FizzBuzz in Smalltalk"

Number extend [
  isMultipleOf: n [
    ^ (self rem: n) = 0
  ]
]

(1 to: 100) do: [:i |
  (i isMultipleOf: 3) ifTrue: [
    (i isMultipleOf: 5) ifTrue: [
      Transcript display: 'FizzBuzz'
    ] ifFalse: [
      Transcript display: 'Fizz'
    ]
  ] ifFalse: [
    (i isMultipleOf: 5) ifTrue: [
      Transcript display: 'Buzz'
    ] ifFalse: [
      Transcript display: i
    ]
  ].
  Transcript cr.
].
