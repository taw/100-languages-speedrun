#!/usr/bin/env elixir

defmodule FizzBuzz do
  def fizzbuzz(n) do
    cond do
      rem(n, 15) == 0 -> "FizzBuzz"
      rem(n, 3) == 0 -> "Fizz"
      rem(n, 5) == 0 -> "Buzz"
      true -> n
    end
  end

  def loop(range) do
    range |> Enum.map(&fizzbuzz/1) |> Enum.each(&IO.puts/1)
  end
end

1..100 |> FizzBuzz.loop
