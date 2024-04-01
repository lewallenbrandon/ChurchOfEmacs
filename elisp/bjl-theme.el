;; Theme Options

(defvar custom-font-size 140)
(defvar custom-variable-font-size 140)
(set-frame-parameter (selected-frame) 'fullscreen 'maximized)
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(set-face-attribute 'default nil :font "Jetbrains Mono" :height custom-font-size)
(set-face-attribute 'fixed-pitch nil :font "Jetbrains Mono" :height custom-font-size)

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package all-the-icons)

(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))

(add-to-list 'load-path "~/.emacs.d/modus-themes")
(require 'modus-themes)

(setq modus-vivendi-tinted-palette-overrides
      '((bg-main "#1d2235")))

(setq modus-themes-common-palette-overrides
      '((border-mode-line-active bg-mode-line-active)
        (border-mode-line-inactive bg-mode-line-inactive)))

(load-theme 'modus-vivendi-tinted :no-confirm)

(unless (display-graphic-p)
  (require 'evil-terminal-cursor-changer)
  (evil-terminal-cursor-changer-activate))


(provide 'bjl-theme)
