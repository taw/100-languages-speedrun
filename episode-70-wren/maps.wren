#!/usr/bin/env wren_cli

var person = {
  "name": "Alice",
  "surname": "Smith",
  "age": 25,
}

System.print("%(person["name"]) %(person["surname"]) is %(person["age"]) years old")

for (prop in person) {
  System.print("Person's %(prop.key) is %(prop.value)")
}

System.print({} == {})
