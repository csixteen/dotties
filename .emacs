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

;; The packages that I want installed. They can also
;; be installed with M-x package-install
(defvar my-packages
  '(
    ;; edit html tags like sexps
    tagedit

    ;; colorful parenthesis matching
    rainbow-delimiters

    ;; Enhances M-x to allow easier execution of commands. Provides
    ;; a filterable list of possible commands in the minibuffer
    ;; http://www.emacswiki.org/emacs/Smex
    smex

    ;; git integration
    magit))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;;------------------------
;;  Basic customizations
;;------------------------

(menu-bar-mode -1)
(global-display-line-numbers-mode)


;;------------
;;  Go stuff
;;------------

(add-hook 'go-mode-hook 'lsp-deferred)

;;---------------
;;  Rust stuff
;;---------------

(add-hook 'rust-mode-hook
	  (lambda () (setq indent-tabs-mode nil)))

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
   '(magit python-mode go-mode markdown-mode gruvbox-theme rust-mode)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
