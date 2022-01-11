#!/usr/bin/perl

$\ = "\n";

# Say hello to %person
sub say_hello {
  # Interpolation only works with variables and
  # a few expressions like $variable{key}
  print "Hello $person{name} $person{surname}";
}

# Hash variable
%person = (
  name => "Alice",
  surname => "Smith",
);

say_hello;

# Be more excited this time!
# local changes are reverted once we exit the block
do {
  local $\ = "! 🎉🎉🎉\n";
  local $person{name} = uc$person{name};
  local $person{surname} = uc$person{surname};
  say_hello;
};

# Back to the usual
say_hello;
