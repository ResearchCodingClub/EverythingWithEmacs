;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; elpy

(use-package elpy
  :config
  ;; Use Python 3 for the backend
  (setq elpy-rpc-python-command "python3"
        ;; Use PyTest to run tests
        elpy-test-runner 'elpy-test-pytest-runner)

  ;; Use flycheck for syntax checking as you type
  (when (require 'flycheck nil t)
    (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
    (add-hook 'elpy-mode-hook 'flycheck-mode)))
