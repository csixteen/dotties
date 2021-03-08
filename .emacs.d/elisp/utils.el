;; -*- emacs-lisp -*-

(defun date ()
  (interactive)
  (insert (format-time-string "%Y-%m-%d")))

(defun search-current-word (direction)
  (let* ((cw (thing-at-point 'word 'no-properties))
         (res (if direction
                  (word-search-backward cw nil t)
                (word-search-forward cw nil t))))
    (when res
      (setf (point) (match-beginning 0)
            (mark) (match-end 0)))))

(defun search-current-word-forward ()
  (interactive)
  (search-current-word nil))

(defun search-current-word-backword ()
  (interactive)
  (search-current-word t))

(global-set-key (kbd "C-*") 'search-current-word-forward)
(global-set-key (kbd "C-#") 'search-current-word-backword)
