;; -*- emacs-lisp -*-

;;--------------
;;   Org mode
;;--------------

(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)

(setq org-todo-keywords
      '((sequence "TODO(t)" "PROGRESS(p!)" "REVIEW(w!)" "|" "DONE(d!) CANCELED(c@)")
        (sequence "REPORT(r!)" "BUG(b!)" "KNOWNCAUSE(k!)" "|" "FIXED(f@/!)")))


(setq org-directory "~/org")
(setq org-agenda-files (list org-directory))
(setq org-default-notes-file (concat org-directory "/notes.org"))

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/org/gtd.org" "Tasks")
         "* TODO %?\n  %i\n  %a")
        ("j" "Journal" entry (file+datetree "~/org/journal.org")
         "* %?\nEntered on %U\n  %i\n  %a")))

(org-babel-do-load-languages 'org-babel-load-languages
                             '(
                               (python . t)
                               (shell . t)))
