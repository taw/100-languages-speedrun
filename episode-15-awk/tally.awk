#!/usr/bin/awk -f

{ tally[$0]++ }

END {
  for(n in tally) {
    print n, tally[n]
  }
}
