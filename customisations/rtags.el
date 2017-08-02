;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; rtags - C++ aware tagging

;; http://www.rtags.net

(use-package rtags
  :init
  ;; Where rtags is installed
  (setq rtags-path "~/Tools/rtags/install/bin")

  ;; Start rtags automatically for C/C++
  (add-hook 'c-mode-common-hook #'rtags-start-process-unless-running)

  :config
  (rtags-enable-standard-keybindings)

  ;; Get completions working with company mode
  (setq rtags-autostart-diagnostics t)
  (rtags-diagnostics)
  (setq rtags-completions-enabled t)
  (push 'company-rtags company-backends)

  ;; Need to have helm installed as well
  (use-package helm-rtags
    :init
    (setq rtags-use-helm t)

    :config
    (setq rtags-display-result-backend 'helm))

  (use-package flycheck-rtags))
