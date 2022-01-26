#!/usr/bin/env io

Date dayOfWeek := method(self asString("%A") asLowercase)

onDay := method(
  arg0 := call message argAt(0) asString
  arg1 := call message argAt(1)
  day := Date now dayOfWeek
  (day == arg0) ifTrue(call sender doMessage(arg1))
)

onDay(monday, "I love Mondays!" println)
onDay(tuesday, "Tuesdays are allright too I guess..." println)
