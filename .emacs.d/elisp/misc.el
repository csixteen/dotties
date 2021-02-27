;; -*- emacs-lisp -*-

;; Backup settings
(setq backup-by-copying t)
(setq backup-directory-alist '(("." . "~/.saves")))
(setq delete-old-versions t)
(setq kept-new-versions 6)
(setq kept-old-versions 2)
(setq version-control t)

;; Backtrace for errors
(setq debug-on-error t)

;; Display byte-compiler warnings on error
(setq byte-compile-debug t)

;; Navigation
(ido-mode t)  ; http://www.emacswiki.org/emacs/InteractivelyDoThings
(global-set-key (kbd "C-x C-b") 'ibuffer)
