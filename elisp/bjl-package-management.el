;; Package Management

;; Initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)

;; Generate the customization file 
(setq custom-file "~/.emacs.d/emacs-custom.el")
(unless (file-exists-p custom-file)
  (with-temp-buffer
    (insert ";; emacs-custom.el")
    (write-file custom-file nil)))
;; or load if it is already exists
(load custom-file)

(unless package-archive-contents
  (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(unless (package-installed-p 'quelpa)
  (with-temp-buffer
    (url-insert-file-contents "https://raw.githubusercontent.com/quelpa/quelpa/master/quelpa.el")
    (eval-buffer)
    (quelpa-self-upgrade)))

(quelpa
 '(quelpa-use-package
   :fetcher git
   :url "https://github.com/quelpa/quelpa-use-package.git"))
(require 'quelpa-use-package)

;;(use-package auto-package-update
;;  :custom
;;  (auto-package-update-interval 7)
;;  (auto-package-update-prompt-before-update t)
;;  (auto-package-update-hide-results t)
;;  :config
;;  (auto-package-update-maybe)
;;  (auto-package-update-at-time "09:00"))


(use-package no-littering)

(provide 'bjl-package-management)
