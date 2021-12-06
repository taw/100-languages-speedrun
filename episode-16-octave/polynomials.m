#!/usr/bin/env octave

a = [2 3 4]
# 2 * 10**2 + 3 * 10**1 + 4
polyval(a, 10)

roots(a)
polyval(a, -0.7500 + 1.1990i)
polyval(a, roots(a)(1))
