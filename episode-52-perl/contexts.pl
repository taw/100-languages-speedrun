#!/usr/bin/perl

$first_person = <STDIN>;
@other_people = <STDIN>;

chomp $first_person;
chomp @other_people;

print "Special welcome to $first_person!\n";
print "Also welcome to ", join(", ", @other_people), "!\n";
