u = [1 1]
m = [1 1; 1 0]

for i=1:40
  result = (u * m ^ (i-1))
  println("fib($i) = $(result[2])")
end
