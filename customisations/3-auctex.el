;; Configuration for LaTeX

(use-package tex
  ;; Confusingly, the "auctex" package provides the "tex" modes, so to
  ;; get it installed automatically, we need this line:
  :ensure auctex

  ;; We only want to do the following things *after* auctex has loaded
  :config
  (setq TeX-auto-save t
        TeX-parse-self t
        TeX-PDF-mode t
        ;; Use relative path to find images
        LaTeX-includegraphics-read-file 'LaTeX-includegraphics-read-file-relative
        ;; Make RefTeX work with auctex
        reftex-plug-into-AUCTeX t
        ;; Replace with path to your bibliography
        reftex-default-bibliography '("~/Documents/library.bib")
        ;; Recognise cleveref references as keywords
        font-latex-match-reference-keywords '(("Cref" "{") ("cref" "{") ("autoref" "{")))

  ;; Synctex integration for playing nice with okular
  (setq TeX-source-correlate-method 'synctex
        TeX-source-correlate-mode t
        TeX-source-correlate-start-server t
        TeX-view-program-list '(("Okular" "okular --unique %o#src:%n$(pwd)/./%b"))
        TeX-view-program-selection '((output-pdf "Okular")
                                     ((output-dvi style-pstricks)
                                      "dvips and gv")
                                     (output-dvi "xdvi")
                                     (output-pdf "Evince")
                                     (output-html "xdg-open")))
  
  (add-hook 'LaTeX-mode-hook 'turn-on-reftex))
