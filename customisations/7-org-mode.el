;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Org mode, including org-babel

(use-package org
  :mode (("\\.org$" . org-mode))

  :bind
  ;; Global key bindings
  (("C-c l" . org-store-link)
   ("C-c a" . org-agenda)
   ("C-c b" . org-iswitchb)
   ("C-c c" . org-capture))

  :init
  (use-package ob-ipython) ; ipython mode for org-babel
  
  :config

  (require 'ox-md) ; Export org to Markdown
  
  (setq
   ;; The location(s) of your todo lists
   org-agenda-files '("~/Documents/org")
   ;; Enable C-c C-t key
   org-use-fast-todo-selection t
   ;; Record date/time when task is finished
   org-log-done 'time
   ;; Layout of clocks (C-c C-x C-r)
   org-columns-default-format "%50ITEM(Task) %10CLOCKSUM %16TIMESTAMP_IA")
  
  (setq org-todo-keywords
        (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
                (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "MEETING" "ONEDAY"))))
  
  (setq org-todo-keyword-faces
        (quote (("TODO" :foreground "red" :weight bold)
                ("NEXT" :foreground "blue" :weight bold)
                ("DONE" :foreground "forest green" :weight bold)
                ("WAITING" :foreground "orange" :weight bold)
                ("HOLD" :foreground "magenta" :weight bold)
                ("CANCELLED" :foreground "forest green" :weight bold)
                ("MEETING" :foreground "forest green" :weight bold)
                ("ONEDAY" :foreground "deep sky blue" :weight bold))))
  
  ;; Transitions which prompt for a reason e.g why task was cancelled
  (setq org-todo-state-tags-triggers
        (quote (("CANCELLED" ("CANCELLED" . t))
                ("WAITING" ("WAITING" . t))
                ("HOLD" ("WAITING") ("HOLD" . t))
                (done ("WAITING") ("HOLD"))
                ("TODO" ("WAITING") ("CANCELLED") ("HOLD"))
                ("NEXT" ("WAITING") ("CANCELLED") ("HOLD"))
                ("DONE" ("WAITING") ("CANCELLED") ("HOLD")))))

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Org-babel settings
  
  ;; Run/highlight code using babel in org-mode
  ;; List of https://orgmode.org/manual/Languages.html
  (org-babel-do-load-languages
   'org-babel-load-languages
   '(
     (python . t)
     (ipython . t)
     (shell . t)
     (C . t)  ; This enables C, C++ and D
     (fortran . t)  ; Uses gfortran
     (lisp . t) ; Common Lisp
     (haskell . t)  ; GHC
     ))
  
  ;; Syntax highlight in #+BEGIN_SRC blocks
  (setq org-src-fontify-natively t)

  ;; Don't prompt before running code in org
  (setq org-confirm-babel-evaluate nil)
  
  ;; display/update images in the buffer after I evaluate
  (add-hook 'org-babel-after-execute-hook 'org-display-inline-images 'append)
  
  ;; Customise how the clock and agenda tasks look
  (setq org-agenda-custom-commands
        '(("c" "Today's clocks"
           ((agenda ""
                    ((org-agenda-span 1)
                     (org-agenda-show-log 'clockcheck)
                     (org-agenda-clockreport-mode t)))))
          ("n" "Week's agenda, tasks"
           ((agenda "" ((org-agenda-span 7)))
            (todo "NEXT")
            (todo "WAITING")
            (todo "MEETING")
            (todo "ONEDAY")
            (alltodo ""))))))
