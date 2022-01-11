#!/usr/bin/perl

$\="\n";

open F, "curl -s https://en.wikipedia.org/wiki/Perl |";
$in_head = false;
while (<F>) {
  $in_head = 1 if /<head>/;
  $in_head = 0 if /<\/head>/;
  if ($in_head) {
    print $1 for /href="(.*?)"/g;
  }
}
