#!/usr/bin/perl

$\="\n";

open F, "curl -s https://en.wikipedia.org/wiki/Perl |";
while (<F>) {
  if (/<head>/ .. /<\/head>/) {
    print $1 for /href="(.*?)"/g;
  }
}
