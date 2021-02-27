;; -*- emacs-lisp -*-

;; By default, Emacs disables a bunch of commands which are actually
;; quite useful, such as C-x C-l and C-x C-u
(setq disabled-command-function nil)

(setq ring-bell-function 'ignore)  ; No need for noise
(show-paren-mode 1)
(global-set-key "\C-xt" 'delete-trailing-whitespace)

;; Use spaces, not tabs, for indentation
(setq-default indent-tabs-mode nil)

;; Make Emacs scroll like Vim
(setq scroll-step           1
      scroll-conservatively 10000)

;; Number of lines of continuity when scrolling by screenfulls
(setq next-screen-context-lines 0)

;; Always use "y" for "yes"
(fset 'yes-or-no-p 'y-or-n-p)
