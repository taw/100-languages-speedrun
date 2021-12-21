#!/usr/bin/env sage

F = GF(101)
EC = EllipticCurve(F, [2, 3])

for i in range(10):
  a = EC.random_element()
  b = EC.random_element()
  print(f"{a} + {b} = {a + b}")
