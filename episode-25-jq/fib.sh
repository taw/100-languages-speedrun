#!/bin/bash

jq --null-input 'include "fib"; [range(1;21) | fib(.)]'
