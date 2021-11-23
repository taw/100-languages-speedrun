-- Fibonacci function
function fib(n)
  if n < 3 then
    return 1
  else
    return fib(n - 1) + fib(n - 2)
  end
end

for i = 1,30 do
  print(fib(i))
end
