#!/usr/bin/env gst

Object subclass: Person [
  | firstName lastName |
  firstName: firstNameVal [ firstName := firstNameVal ]
  lastName: lastNameVal [ lastName := lastNameVal ]
  firstName [ ^firstName ]
  lastName [ ^lastName ]

  Person class >> firstName: firstNameVal lastName: lastNameVal [
    ^(self new)
      firstName: firstNameVal;
      lastName: lastNameVal;
      yourself.
  ]
  "x printOn: stream vs stream nextPutAll: x is like inspect vs to_s"
  printOn: stream [
    stream
      nextPutAll: firstName;
      nextPutAll: ' ';
      nextPutAll: lastName.
  ]
].

Object subclass: Delegator [
  | object |
  object: objectVal [ object := objectVal ]
  object [ ^object ]

  doesNotUnderstand: aMessage [
    Transcript
      display: 'Forwarding message: ';
      display: aMessage;
      display: ' to object: ';
      display: object;
      cr.
    ^object perform: aMessage
  ]

  printOn: stream [
    stream nextPutAll: 'Delegator for '.
    object printOn: stream.
  ]
]

a := Person firstName: 'Alice' lastName: 'Wonderland'.
b := (Delegator new) object: a.

Transcript
  display: a; cr;
  display: (a firstName); cr;
  display: (a lastName); cr;
  display: b; cr;
  display: (b firstName); cr;
  display: (b lastName); cr.
