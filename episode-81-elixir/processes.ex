#!/usr/bin/env elixir

defmodule Greeter do
  def loop(counter) do
    receive do
      {:hello, msg} -> IO.puts("#{counter}: Hello, #{msg}!")
    end
    loop(counter + 1)
  end
end

greeter_pid = spawn(fn -> Greeter.loop(1) end)
send(greeter_pid, {:hello, "World"})
send(greeter_pid, {:hello, "Alice"})
send(greeter_pid, {:hello, "Bob"})
send(greeter_pid, {:hello, "Eve"})
