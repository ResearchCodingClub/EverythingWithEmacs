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
