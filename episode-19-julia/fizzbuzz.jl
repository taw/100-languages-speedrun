function fizzbuzz(n)
  if n % 15 == 0
    "FizzBuzz"
  elseif n % 5 == 0
    "Buzz"
  elseif n % 3 == 0
    "Fizz"
  else
    n
  end
end

for i=1:100
  println(fizzbuzz(i))
end
