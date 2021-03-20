;; -*- emacs-lisp -*-

(defun date ()
  (interactive)
  (insert (format-time-string "%Y-%m-%d")))
