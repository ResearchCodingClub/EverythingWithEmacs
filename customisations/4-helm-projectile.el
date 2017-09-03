;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Helm

(use-package helm
  :diminish helm-mode
  :bind
  (("C-x C-f" . helm-find-files)
   ("M-x" . helm-M-x)
   ("M-y" . helm-show-kill-ring)
   ("C-x b" . helm-mini)
   ("C-c h" . helm-command-prefix)
   :map helm-map
   ([tab] . helm-execute-persistent-action)
   ;; So tab also works in terminal
   ("C-i" . helm-execute-persistent-action)
   ("C-z" . helm-select-action))

  :init
  ;; Make helm less ugly
  (setq helm-display-header-line nil
        ;; Nice window size
        helm-split-window-in-side-p t
        helm-autoresize-max-height 30
        helm-autoresize-min-height 30)

  :config
  (require 'helm-config)

  (set-face-attribute 'helm-source-header nil :height 1.0)
  (helm-autoresize-mode 1)

  (helm-mode 1)

  ;; Don't use helm for settings tags in org-mode
  (add-to-list 'helm-completing-read-handlers-alist '(org-set-tags))
  (add-to-list 'helm-completing-read-handlers-alist '(org-tags-view))

  :diminish helm-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Projectile - project management

(use-package projectile
  :init
  (use-package helm-projectile
    :init
    (setq projectile-completion-system 'helm))

  :config
  (projectile-mode t)

  (helm-projectile-on)

  :diminish projectile-mode)
