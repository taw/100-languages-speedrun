#!/usr/bin/perl

$\="\n";

print 1/7;

{
  use bigrat;
  print 1/7;
};

print 1/7;
