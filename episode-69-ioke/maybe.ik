#!/usr/bin/env ioke

random = method(min, max, min + System randomNumber % (max - min + 1))

maybe = macro((random(0,1) == 0) ifTrue(call argAt(0)))

for(i <- 1..10, maybe(i println))
