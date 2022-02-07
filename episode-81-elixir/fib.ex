#!/usr/bin/env elixir

defmodule Fib do
  def done(n, value) do
    IO.puts("fib(#{n}) = #{value}")
    send(:"fib#{n+1}", {:fib, n, value})
    send(:"fib#{n+2}", {:fib, n, value})
  end

  def waitforprevious(n, a, b) do
    {a, b} = receive do
      {:fib, m, value} -> cond do
        m == n - 1 -> {value, b}
        m == n - 2 -> {a, value}
        true -> {a, b}
      end
    end

    if (a == 0 or b == 0) do
      waitforprevious(n, a, b)
    else
      done(n, a + b)
    end
  end

  def calculate(n) do
    if n <= 2 do
      done(n, 1)
    else
      waitforprevious(n, 0, 0)
    end
  end
end

(1..40) |> Enum.each(fn n ->
  Process.register(spawn(Fib, :calculate, [n]), :"fib#{n}")
end)
