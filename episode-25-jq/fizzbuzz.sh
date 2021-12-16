#!/bin/bash

seq 1 100 | jq -r 'include "fizzbuzz"; fizzbuzz'
