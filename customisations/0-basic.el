;; Basic customisations

;; Custom customisations file
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file t)

;; Remember minibuffer history across sessions:
(savehist-mode 1)

;; Remember lots of history lines:
(setq history-length 100)

;; No startup screen
(setq inhibit-startup-screen t)

;; Highlight region
(transient-mark-mode 1)

;; Display line and column numbers on the status line
(setq line-number-mode   t)
(setq column-number-mode t)

;; Always display in mode line current function point is in (when
;; available)
(which-function-mode t)

;; When saving files, set execute permission if #! is in first line.
(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)

;; Follow symlinks into version controlled directories
(setq vc-follow-symlinks t)

;; Turn off menu-bar, tool-bar, scroll-bar
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode nil)

;; Some nifty moving between windows
(windmove-default-keybindings)

;; Desktop mode
(desktop-save-mode 1)
(setq desktop-path '("~/.emacs.d/" "~" "~/.emacs.d/desktop"))

;; Dictionary
(setq ispell-dictionary "british")
