#!/usr/bin/env pyret -q

fun fib(n):
  if n <= 2:
    1
  else:
    fib(n - 2) + fib(n - 1)
  end
end
check:
  fib(1) is 1
  fib(2) is 1
  fib(10) is 55
end

for each(n from range(1, 21)):
  block:
    print("fib(")
    print(n)
    print(")=")
    print(fib(n))
    print("\n")
  end
end
