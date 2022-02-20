#!/usr/bin/env rexx

a.name = "Alice"
a.surname = "Smith"
a.age = 25

b.name = "Bob"
b.surname = "Nilson"
b.age = 30

c.name = "Charlie"

call print_person a
call print_person "B"
call print_person c

exit

print_person:
  person = arg(1)
  name_ = value(person || ".name")
  surname_ = value(person || ".surname")
  age_ = value(person || ".age")
  say name_ || " " || surname_ || " is " || age_ || " years old"
