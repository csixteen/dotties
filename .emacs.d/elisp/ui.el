;; -*- emacs-lisp -*-

(setq inhibit-splash-screen t)

(set-frame-font "Hack Bold 12")

(add-to-list 'initial-frame-alist '(fullscreen . maximized))

;; Remove the clutter

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Mode line

(column-number-mode)
(display-time)
(display-battery-mode)
(global-display-line-numbers-mode)
(global-hl-line-mode 1)
(which-function-mode)

;; Split the window vertically when opening a status pane

(setq split-height-threshold 0)
(setq split-width-threshold 0)
