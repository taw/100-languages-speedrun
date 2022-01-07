#!/usr/bin/env elvish

var catfacts = (curl -s 'https://cat-fact.herokuapp.com/facts' | from-json)
for fact $catfacts { echo $fact[text] }
