;; -*- emacs-lisp -*-

;;------------------
;;   Company mode
;;------------------

(add-hook 'after-init-hook 'global-company-mode)
(setq company-minimum-prefix-length 1
      company-idle-delay 0.0)


;;-----------------
;;    Org mode
;;-----------------

(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(setq org-agenda-files '(
                         "~/org/reads.org"
                         "~/org/future.org"))


;;------------
;;  Go stuff
;;------------

(add-hook 'go-mode-hook #'lsp)
(add-hook 'before-save-hook 'gofmt-before-save)


;;---------------
;;  Rust stuff
;;---------------

(add-hook 'rust-mode-hook #'lsp)
(setq rust-format-on-save t)
