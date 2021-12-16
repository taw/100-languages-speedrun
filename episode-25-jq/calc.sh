#!/bin/bash

seq 1 10 | jq '(. / 10) + 2'
