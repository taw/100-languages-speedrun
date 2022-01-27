#!/usr/bin/env ioke

a = {
  "name" => "Alice",
  "last_name" => "Smith",
  "age" => 25,
}
a["age"] = 26

"#{a["name"]} #{a["last_name"]} is #{a["age"]} years old" println
a println
