#!/bin/bash

echo '{"name": "Alice", "surname": "Smith"}' | perl -e 'use JSON; $_=decode_json(<>); print JSON->new->ascii->pretty->encode({"hello"=>$_->{"name"}})'
