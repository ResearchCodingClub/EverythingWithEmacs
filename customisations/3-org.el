;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Org mode customisations

(use-package org
  :ensure nil
  :config
  (setq org-log-done 'time))

;; Spell-checking on the fly
(use-package flyspell
  :defer t
  :init
  (add-hook 'org-mode-hook 'flyspell-mode))
