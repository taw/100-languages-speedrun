numbers = (1:10)

println(
  [x for x in numbers if x % 2 == 0]
)
println(
  filter(iseven, numbers)
)
println(
  filter(x->x%2 == 0, numbers)
)
println(
  filter(numbers) do x
    x%2 == 0
  end
)
