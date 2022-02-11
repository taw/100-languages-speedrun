#!/usr/bin/env emacs -Q --script

(defun prints (&rest args)
  (if (consp args)
    (progn
      (princ (car args))
      (princ "\n")
      (apply 'prints (cdr args)))))

(prints
  (length "Hello")
  (length "Żółw")
  (length "💰")
  (downcase "Żółw")
  (upcase "Żółw"))
