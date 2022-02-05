#!/usr/bin/env ruby

i1 = 0
i0 = 0
ic = 9
t = 0
f = 0
pos = 0
cnt = 100

while cnt > 0
  cnt -= 1
  i0 += 1
  if ic == 0
    i0 = 0
    i1 += 1
    ic = 9
  else
    ic -= 1
  end
  f = f == 0 ? 4 : f-1
  t = t == 0 ? 2 : t-1
  pos += 10

  if t == 0
    print "Fizz"
  end

  if f == 0
    print "Buzz"
  end

  if t != 0
    if f !=0
      if i1 != 0
        print i1
      end
      print i0
    end
  end

  print "\n"
end
