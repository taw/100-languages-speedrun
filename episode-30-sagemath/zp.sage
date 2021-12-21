#!/usr/bin/env sage

p = 65537
F = GF(p)

print("Some addition in GF(65537):")
for i in range(10):
  a = F.random_element()
  b = F.random_element()
  print(f"{a} + {b} = {a + b}")

print("Some inverses in GF(65537):")
for i in range(10):
  a = F.random_element()
  b = a^-1
  print(f"{a} * {b} = {a * b}")
