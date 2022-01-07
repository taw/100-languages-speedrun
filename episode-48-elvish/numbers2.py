#!/usr/bin/env python3

import signal

signal.signal(signal.SIGPIPE, signal.SIG_DFL)

for n in range(1,10000):
  print(n)
