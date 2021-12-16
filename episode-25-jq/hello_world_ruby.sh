#!/bin/bash

echo '{"name": "Alice", "surname": "Smith"}' | ruby -rjson -e 'data=JSON.parse(STDIN.read); puts JSON.pretty_generate(hello: data["name"])'
