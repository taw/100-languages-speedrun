#!/usr/bin/env pyret -q

data Person:
  person(first-name, last-name)
end
check:
  to-string(person("Alice", "Smith")) is "person(Alice, Smith)"
end

people = [list:
  person("Alice", "Wonderland"),
  person("Bob", "Marley"),
  person("Eve", "Jackson"),
]

for each(a-person from people):
  print(to-string(a-person) + "\n")
end
