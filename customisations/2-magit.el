;; Install magit for working with git
;; Needs Emacs 24.4+

(use-package magit
  ;; In case you didn't set use-package-always-ensure to t, you can
  ;; use `:ensure t` here
  :ensure t

  ;; Choose your own key binding!
  ;; Note the dot between the keys and
  ;; the function name here
  :bind
  (("\C-cm" . magit-status))

  ;; Things to run *before* package loads
  :init
  ;; I prefer Emacs to split the window vertically, so try and force
  ;; that by setting suitable thresholds
  (setq split-height-threshold 1600)
  (setq split-width-threshold 160)

  ;; Wrap at 72 columns automatically when writing git log messages
  (defun my-turn-on-auto-fill ()
    (setq fill-column 72)
    (turn-on-auto-fill))

  ;; When we start "magit-log-edit-mode", run the function
  ;; "my-turn-on-auto-fill"
  (add-hook 'magit-log-edit-mode-hook 'my-turn-on-auto-fill))
  
