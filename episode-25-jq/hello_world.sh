#!/bin/bash

echo '{"name": "Alice", "surname": "Smith"}' | jq '{"hello": .name}'
