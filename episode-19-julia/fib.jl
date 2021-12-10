function fib(n)
  if n <= 2
    1
  else
    fib(n-1) + fib(n-2)
  end
end

for i=1:30
  println(fib(i))
end
