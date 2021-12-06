#!/usr/bin/env octave

x = (0:44100) * (100 * 2 * pi / 44100);
y = sin(x);
player = audioplayer(y, 44100, 8);
play(player);
pause(1.1);
