#!/usr/bin/env octave

x = -10:0.1:10
y = cos(x)
plot(x, y)
title("Function plot")
xlabel("x")
ylabel("cos(x)")
waitforbuttonpress()
