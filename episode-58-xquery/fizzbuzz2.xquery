declare option output:method "text";
declare option output:item-separator "";

for $n in (1 to 100)
let $fizz := $n mod 3 = 0
let $buzz := $n mod 5 = 0
return (
  if ($fizz and $buzz)
    then "FizzBuzz&#10;"
  else if ($buzz)
    then "Buzz&#10;"
  else if ($fizz)
    then "Fizz&#10;"
    else concat($n, "&#10;")
)
