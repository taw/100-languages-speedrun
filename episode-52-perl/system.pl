#!/usr/bin/perl

$os = `uname -ms`;
chomp $os;

{
  local $ENV{LC_ALL} = 'ru_RU';
  $date = `date`;
  chomp $date;
};

print "You're on $os\n";
print "In Russian, date is $date\n";

print "Number of characters in numbers 1 to 1_000_000 is: ";
open(F, "|wc -c");
print F $_ for 1..1_000_000;
close F;
