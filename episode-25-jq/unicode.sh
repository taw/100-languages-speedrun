#!/bin/bash

echo '["Hello", "Żółw", "🍰"]' | jq '.[] | length'
