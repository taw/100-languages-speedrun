#!/bin/bash

echo '{"name": "Alice", "surname": "Smith"}' | ./rq '{hello: $_["name"]}'
{
  "hello": "Alice"
}
