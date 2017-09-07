;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Package manager stuff
(require 'package)

;; Add the melpa package repository, making sure to use https (also
;; use https for the default gnu repo)
(setq package-archives
      '(("gnu" . "https://elpa.gnu.org/packages/")
        ("melpa" . "https://melpa.org/packages/")))

;; Do some basic hardening of the package system
;; See https://glyph.twistedmatrix.com/2015/11/editor-malware.html
;; This section might not work on all systems, requires gnutls-cli
;; command line utility

;; Always check certificates!
(setq tls-checktrust t)
;; Set trust roots
(let ((trustfile
       (replace-regexp-in-string
        "\\\\" "/"
        (replace-regexp-in-string
         "\n" ""
         (shell-command-to-string "python -m certifi")))))
  (setq tls-program
        (list
         (format "gnutls-cli%s --x509cafile %s -p %%p %%h"
                 (if (eq window-system 'w32) ".exe" "") trustfile)))
  (setq gnutls-verify-error t)
  (setq gnutls-trustfiles (list trustfile)))

;; Initialise packages now
(setq package-enable-at-startup nil)
(package-initialize)

;; Check we have use-package installed -- if not, install it!
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; We also need diminish and bind-key for use-package
(eval-when-compile
  (require 'use-package))
(require 'diminish)
(require 'bind-key)

;; By default, ensure all packages are installed
(setq use-package-always-ensure t)
