#!/usr/bin/awk -f

BEGIN {
  for(i=0; i<ARGV[2]; i++) {
    print int(rand() * ARGV[1]);
  }
}
