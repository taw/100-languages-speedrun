#!/usr/bin/env racket
#lang racket

(require net/url)
(require json)

(define url "http://worldtimeapi.org/api/timezone/Asia/Tokyo")
(define response
  (call/input-url (string->url url)
                get-pure-port
                read-json))

(displayln (hash-ref response 'datetime))
