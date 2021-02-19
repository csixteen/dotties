;; -*- emacs-lisp -*-

;; If I'm on Linux (I use Gentoo)
(if (eq system-type 'gnu/linux)
  (require 'site-gentoo))

;; Define package repositories
(require 'package)
(add-to-list 'package-archives
             '("tromey" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; Load and activate emacs packages. Do this first so that the
;; packages are loaded before you start trying to modify them.
;; This also sets the load path.
(package-initialize)

;; Download the ELPA archive description if needed.
;; This informs Emacs about the latest versions of all packages, and
;; makes them available for download.
(when (not package-archive-contents)
  (package-refresh-contents))

;;------------------------
;;  Basic customizations
;;------------------------

(menu-bar-mode -1)  ; Removes clutter
(global-display-line-numbers-mode)
(show-paren-mode 1)

;; Mode line
(column-number-mode)
(which-function-mode)
(display-time)
(display-battery-mode)

;; Backup settings
(setq backup-by-copying t)
(setq backup-directory-alist '(("." . "~/.saves")))
(setq delete-old-versions t)
(setq kept-new-versions 6)
(setq kept-old-versions 2)
(setq version-control t)

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

;;------------
;;  Go stuff
;;------------

(add-hook 'go-mode-hook #'lsp)

;;---------------
;;  Rust stuff
;;---------------

(add-hook 'rust-mode-hook
	  (lambda () (setq indent-tabs-mode nil)))
(add-hook 'rust-mode-hook #'lsp)
(setq rust-format-on-save t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes '(gruvbox-dark-medium))
 '(custom-safe-themes
   '("7661b762556018a44a29477b84757994d8386d6edee909409fabe0631952dad9" default))
 '(package-selected-packages
   '(lsp-treemacs treemacs company lsp-mode magit python-mode go-mode markdown-mode gruvbox-theme rust-mode)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
