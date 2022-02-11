#!/usr/bin/env emacs -Q --script

(defun prints (&rest args)
  (if (consp args)
    (progn
      (princ (car args))
      (apply 'prints (cdr args)))))

(defun fib (n)
  (if (<= n 2)
    1
    (+ (fib (- n 1)) (fib (- n 2)))))

(defmacro dorange (i a b &rest body)
  `(let ((,i ,a))
     (while (<= ,i ,b)
       ,@body
       (setq ,i (+ ,i 1)))))

(dorange n 1 30
  (prints "fib(" n ")=" (fib n) "\n"))
