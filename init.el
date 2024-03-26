;; Performance Startup Tracking
(setq gc-cons-threshold (* 50 1000 1000))
(defun bjl/display-startup-time ()
  (message "Emacs loaded in %s with %d garbage collections."
           (format "%.2f seconds"
                   (float-time
                    (time-subtract after-init-time before-init-time)))
           gcs-done))

(add-hook 'emacs-startup-hook #'bjl/display-startup-time)

;; Initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)

(setq custom-file "~/.emacs.d/emacs-custom.el")
(unless (file-exists-p custom-file)
  (with-temp-buffer
    (insert ";; emacs-custom.el")
    (write-file custom-file nil)))

(load custom-file)

(defvar emacs-lisp-components-dir "~/.emacs.d/elisp")
(add-to-list 'load-path emacs-lisp-components-dir) 

(require 'bjl-packages)
(require 'bjl-custom-functions)
(require 'bjl-defaults)
(require 'bjl-keybinds)
(require 'bjl-org)
(require 'bjl-utility-packages)
(require 'bjl-theme)
(require 'bjl-programming)
(require 'bjl-terminal)
(require 'bjl-finalize)
