#!/usr/bin/env sage

f = 1/x

print("Integral of f(x) = 1/x from 5 to 10:")
print(f.integral(x, 5, 10))

print("Numerical approximation to 100 binary digits:")
print(f.integral(x, 5, 10).n(100))
