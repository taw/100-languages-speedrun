#!/usr/bin/env rexx

a.0 = 20

do i = 1 to 20
  a.i = 2 * i
end

b.0 = 3

do i = 1 to 3
  b.i = 21 + i
end

say sum(a)
say sum(b)
exit

sum:
  array_name = arg(1)
  array_size = value(array_name || ".0")
  result = 0
  do i = 1 to array_size
    result = result + value(array_name || "." || i)
  end
  return result
