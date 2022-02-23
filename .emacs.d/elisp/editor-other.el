;; -*- emacs-lisp -*-

;;------------------
;;   Company mode
;;------------------

(add-hook 'after-init-hook 'global-company-mode)
(setq company-minimum-prefix-length 1
      company-idle-delay 0.0)
