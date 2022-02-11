#!/usr/bin/env emacs -Q --script

(defun read-file (path)
  (with-temp-buffer
    (insert-file-contents path)
    (buffer-string)))
(defun read-lines (path)
  (split-string (read-file path) "\n" t))
(defun random-element (list)
  (nth (random (length list)) list))

(defun report-wordle-blocks (guess word)
  (dotimes (i 5)
    (let ((gi (substring guess i (+ i 1)))
          (wi (substring word i (+ i 1))))
      (princ
        (cond
          ((equal gi wi) "🟩")
          ((string-match-p (regexp-quote gi) word) "🟨")
          (t "🟥")))))
  (princ "\n"))

(defun report-wordle (guess word)
  (if (/= (length guess) 5)
    (princ "Please enter a 5 letter word.\n")
    (report-wordle-blocks guess word)))


(setq word-list (read-lines "wordle-answers-alphabetical.txt"))
(setq word (random-element word-list))
(setq guess "")

(while (not (equal guess word))
  (setq guess (read-from-minibuffer "Guess: "))
  (report-wordle guess word))
