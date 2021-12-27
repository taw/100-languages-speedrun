#!/usr/bin/env osascript

display alert "Cats or Dogs?" buttons {"Cats!", "Dogs!"}
set animal to button returned of the result
if animal is "Cats!" then
  say "meow"
else
  say "woof woof"
end if
