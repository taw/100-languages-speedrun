#!/usr/bin/env sage

print("limit of sin(x) / x as x approaches 0")
print(limit(sin(x) / x, x=0))

print("limit of sin(x) / x as x approaches infinity")
print(limit(sin(x) / x, x=oo))

print("limit of (1+1/x)^x as x approaches infinity")
print(limit((1+1/x)^x, x=oo))
