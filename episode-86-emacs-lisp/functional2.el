#!/usr/bin/env emacs -Q --script
;; -*- lexical-binding: t -*-

(setq list '(1 2 3 4 5))

(setq add2 (lambda (n) (+ n 2)))
(print (mapcar add2 list))

(defun addn (n) (lambda (m) (+ n m)))
(setq add3 (addn 3))
(print (mapcar add3 list))
