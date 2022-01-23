#!/usr/bin/env xonsh

import json

doc = $(curl -s "https://cat-fact.herokuapp.com/facts")

for fact in json.loads(doc):
  print(fact["text"])
