;; Some customisations for C-like languages

;; Brackets and whitespace how I like them
(setq-default c-default-style "k&r"
              c-basic-offset 2
              indent-tabs-mode nil
              tab-width 4)

(defun cleanup-c-buffer ()
  "Correctly indent, remove tabs and extra whitespace in C source code"
  (interactive)
  (c-indent-region (point-min) (point-max))
  (untabify (point-min) (point-max))
  (whitespace-cleanup-region (point-min) (point-max)))


;; Use pretty colours when we're compiling
(use-package ansi-color
  :init
  (defun colorize-compilation-buffer ()
    (toggle-read-only)
    (ansi-color-apply-on-region (point-min) (point-max))
    (toggle-read-only))
  (add-hook 'compilation-filter-hook 'colorize-compilation-buffer)
  ;; Colour in shell?
  (add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Compile customisation

(use-package cl
  ;; cl is a built-in package, so don't try and install it!
  :ensure nil

  :bind
  (("<f5>" . recompile))

  :init
  (setq
   compilation-scroll-output 'first-error   ;; scroll until first error
   compilation-skip-threshold 2             ;; skip warnings
   compilation-read-command t               ;; confirm compile command
   compilation-window-height 12             ;; keep it readable
   compilation-auto-jump-to-first-error nil ;; jump to first error auto
   compilation-auto-jump-to-next-error nil  ;; jump to next error
   )

  ;; If there were no compilation errors, delete the compilation window
  (setq compilation-exit-message-function
        (lambda (status code msg)
          ;; If M-x compile exits with a 0
          (when (and (eq status 'exit) (zerop code))
            ;; then bury the *compilation* buffer, so that C-x b doesn't go there
            (bury-buffer "*compilation*")
            ;; and return to whatever were looking at before
            (replace-buffer-in-windows "*compilation*"))
          ;; Always return the anticipated result of compilation-exit-message-function
          (cons msg code))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Company mode for code completion

(use-package company
  :config
  (global-company-mode)

  :diminish company-mode)

(use-package irony
  :config
  (use-package company-irony
    :ensure t
    :config
    (push 'company-irony company-backends)))
