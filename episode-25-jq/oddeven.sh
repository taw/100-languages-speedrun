#!/bin/bash

jq --null-input 'range(1;11) | {number: ., (if . % 2 == 0 then "even" else "odd" end): true }'
