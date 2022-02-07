#!/usr/bin/env elixir

defmodule Account do
  def loop(name, balance) do
    new_balance = receive do
      {:deposit, value} -> balance + value
      {:withdraw, value} -> balance - value
    end
    IO.puts("Balance for #{name} changed from #{balance} to #{new_balance}")
    loop(name, new_balance)
  end

  def create(name, initial_balance) do
    IO.puts("Account created for #{name} with initial balance #{initial_balance}")
    loop(name, initial_balance)
  end
end

defmodule Bank do
  def transfer(map, from_name, to_name, amount) do
    send(Map.get(map, from_name), {:withdraw, amount})
    send(Map.get(map, to_name), {:deposit, amount})
    loop(map)
  end

  def create_account(map, name, initial_balance) do
    pid = spawn(Account, :create, [name, initial_balance])
    map = Map.put(map, name, pid)
    loop(map)
  end

  def loop(map) do
    receive do
      {:create_account, name, initial_balance}
        -> create_account(map, name, initial_balance)
      {:transfer, from_name, to_name, amount}
        -> transfer(map, from_name, to_name, amount)
    end
  end

  def create do
    loop(%{})
  end
end

bank = spawn(Bank, :create, [])

send(bank, {:create_account, "Alice", 1000})
send(bank, {:create_account, "Bob", 2000})
send(bank, {:create_account, "Eve", 200})
send(bank, {:transfer, "Alice", "Bob", 500})
send(bank, {:transfer, "Bob", "Eve", 220})
