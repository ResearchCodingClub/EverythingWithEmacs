;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Helm

(use-package helm
  :diminish helm-mode
  :bind
  ;; These first set of keys replace some of the standard Emacs
  ;; functions with their Helm counterparts
  (("C-x C-f" . helm-find-files)
   ("M-x" . helm-M-x)
   ("M-y" . helm-show-kill-ring)
   ("C-x b" . helm-mini)
   ("C-c h" . helm-command-prefix)
   ;; This next set of keys are just within a Helm sessions
   :map helm-map
   ([tab] . helm-execute-persistent-action)
   ;; So tab also works in terminal
   ("C-i" . helm-execute-persistent-action)
   ("C-z" . helm-select-action))

  :init
  ;; Make helm less ugly
  (setq helm-display-header-line nil
        ;; If we've got split windows, put the Helm session in the
        ;; active window, rather than cutting across all of them
        helm-split-window-in-side-p t
        ;; Nice window size
        helm-autoresize-max-height 30
        helm-autoresize-min-height 30)

  :config
  (require 'helm-config)

  ;; Normal sized header
  (set-face-attribute 'helm-source-header nil :height 1.0)
  ;; Automatically resize the Helm window 
  (helm-autoresize-mode t)

  ;; Turn on Helm mode 
  (helm-mode 1)

  ;; Don't use helm for settings tags in org-mode
  (add-to-list 'helm-completing-read-handlers-alist '(org-set-tags))
  (add-to-list 'helm-completing-read-handlers-alist '(org-tags-view))

  ;; Don't display Helm in the mode line
  :diminish helm-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Projectile - project management

(use-package projectile
  :init
  ;; Use the Helm interface for Projectile
  (use-package helm-projectile
    :init
    (setq projectile-completion-system 'helm))

  :config
  ;; Turn on Projectile and the Helm interface
  (projectile-mode t)
  (helm-projectile-on)

  ;; Don't display Projectile in the mode line
  :diminish projectile-mode)
