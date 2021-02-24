;; -*- emacs-lisp -*-

(setq inhibit-spash-screen-t t)

(set-frame-font "Hack Bold 11")

;; If I'm on Linux (I use Gentoo)
(if (eq system-type 'gnu/linux)
  (require 'site-gentoo))


;;--------------------------------------
;;   Package repositories and sources
;;--------------------------------------

(require 'package)
(add-to-list 'package-archives '("tromey" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives '("melpa"  . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("gnu"    . "http://elpa.gnu.org/packages/"))

(add-to-list 'load-path "~/.emacs.d/elisp")

;; Load and activate emacs packages. Do this first so that the
;; packages are loaded before you start trying to modify them.
;; This also sets the load path.
(package-initialize)

;; Download the ELPA archive description if needed.
;; This informs Emacs about the latest versions of all packages, and
;; makes them available for download.
(when (not package-archive-contents)
  (package-refresh-contents))


;; The packages I want to have installed. This is to prevent
;; having to run `package-install-selected-packages` in new
;; environments.
(defvar my-packages
  '(
    color-theme-sanityinc-tomorrow
    company
    go-mode
    gruvbox-theme
    lsp-mode
    lsp-treemacs
    magit
    markdown-mode
    paredit
    python-mode
    rainbow-delimiters
    rust-mode
    slime
    treemacs
    zenburn-theme))

(dolist (p my-packages)
  (unless (package-installed-p p)
    (package-install p)))


;;------------------------
;;  Basic customizations
;;------------------------

;; Removes clutter
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(setq rinb-bell-function 'ignore)
(show-paren-mode 1)
(global-set-key "\C-xt" 'delete-trailing-whitespace)

;; Use spaces, not tabs, for indentation.
(setq-default indent-tabs-mode nil)

;; Making Emacs scroll like Vim
(setq scroll-step           1
      scroll-conservatively 10000)

;; Number of lines of continuity when scrolling by screenfulls
(setq next-screen-context-lines 0)

;; Always use "y" for "yes"
(fset 'yes-or-no-p 'y-or-n-p)

;; Mode line
(column-number-mode)
(display-time)
(display-battery-mode)
(global-display-line-numbers-mode)
(global-hl-line-mode 1)
(which-function-mode)

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

(setq split-height-threshold 0)
(setq split-width-threshold 0)


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


;;----------------
;;   SLIME mode
;;----------------

(setq inferior-lisp-program "sbcl")

;; Enable Paredit.
(add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook 'enable-paredit-mode)
(add-hook 'ielm-mode-hook 'enable-paredit-mode)
(add-hook 'lisp-mode-hook 'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook 'enable-paredit-mode)
(add-hook 'slime-repl-mode-hook 'enable-paredit-mode)

(defun override-slime-del-key ()
  (define-key slime-repl-mode-map
    (read-kbd-macro paredit-backward-delete-key) nil))

(add-hook 'slime-repl-mode-hook 'override-slime-del-key)

;; Enable Rainbow Delimiters.
(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)
(add-hook 'ielm-mode-hook 'rainbow-delimiters-mode)
(add-hook 'lisp-mode-hook 'rainbow-delimiters-mode)
(add-hook 'lisp-interaction-mode-hook 'rainbow-delimiters-mode)
(add-hook 'slime-repl-mode-hook 'rainbow-delimiters-mode)

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


;;-----------
;;   Utils
;;-----------

(defun date()
  (interactive)
  (insert (format-time-string "%Y-%m-%d")))


;;--------------------------
;;   Auto-generated stuff
;;--------------------------

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(beacon-color "#f2777a")
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(custom-enabled-themes '(zenburn))
 '(custom-safe-themes
   '("76bfa9318742342233d8b0b42e824130b3a50dcc732866ff8e47366aed69de11" "990e24b406787568c592db2b853aa65ecc2dcd08146c0d22293259d400174e37" "6b80b5b0762a814c62ce858e9d72745a05dd5fc66f821a1c5023b4f2a76bc910" "aaa4c36ce00e572784d424554dcc9641c82d1155370770e231e10c649b59a074" "d6603a129c32b716b3d3541fc0b6bfe83d0e07f1954ee64517aa62c9405a3441" "e074be1c799b509f52870ee596a5977b519f6d269455b84ed998666cf6fc802a" "0685ffa6c9f1324721659a9cd5a8931f4bb64efae9ce43a3dba3801e9412b4d8" "5b809c3eae60da2af8a8cfba4e9e04b4d608cb49584cb5998f6e4a1c87c057c4" "e6ff132edb1bfa0645e2ba032c44ce94a3bd3c15e3929cdf6c049802cf059a2a" "fce3524887a0994f8b9b047aef9cc4cc017c5a93a5fb1f84d300391fba313743" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "e6df46d5085fde0ad56a46ef69ebb388193080cc9819e2d6024c9c6e27388ba9" "d14f3df28603e9517eb8fb7518b662d653b25b26e83bd8e129acea042b774298" "6bdcff29f32f85a2d99f48377d6bfa362768e86189656f63adbf715ac5c1340b" "78c4238956c3000f977300c8a079a3a8a8d4d9fee2e68bad91123b58a4aa8588" "83e0376b5df8d6a3fbdfffb9fb0e8cf41a11799d9471293a810deb7586c131e6" "6b5c518d1c250a8ce17463b7e435e9e20faa84f3f7defba8b579d4f5925f60c1" "7661b762556018a44a29477b84757994d8386d6edee909409fabe0631952dad9" default))
 '(flycheck-color-mode-line-face-to-color 'mode-line-buffer-id)
 '(frame-background-mode 'dark)
 '(nrepl-message-colors
   '("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3"))
 '(package-selected-packages
   '(paredit rainbow-delimiters slime doom-themes color-theme-sanityinc-tomorrow zenburn-theme lsp-treemacs treemacs company lsp-mode magit python-mode go-mode markdown-mode gruvbox-theme rust-mode))
 '(pdf-view-midnight-colors '("#282828" . "#fbf1c7"))
 '(window-divider-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
