macro unless(condition, expression)
  quote
    if !($condition)
      $expression
    end
  end |> esc
end

println("Enter number:")
num = parse(Int, readline())

if isodd(num)
  println("$num is odd")
end

@unless isodd(num) begin
  println("$num is even")
end
