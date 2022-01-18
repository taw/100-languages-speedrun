for $n in (1 to 100)
let $fizz := $n mod 3 = 0
let $buzz := $n mod 5 = 0
return (
  if ($fizz and $buzz)
    then "FizzBuzz"
  else if ($buzz)
    then "Buzz"
  else if ($fizz)
    then "Fizz"
    else $n
)
