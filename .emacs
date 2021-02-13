;; -*- emacs-lisp -*-

(require 'site-gentoo)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(menu-bar-mode -1)
(global-display-line-numbers-mode)

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
   '(python-mode go-mode markdown-mode gruvbox-theme rust-mode)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;------------
;;  Go stuff
;;------------

(add-hook 'go-mode-hook 'lsp-deferred)

;;---------------
;;  Rust stuff
;;---------------

(add-hook 'rust-mode-hook
	  (lambda () (setq indent-tabs-mode nil)))
