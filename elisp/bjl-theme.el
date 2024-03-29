;; Theme Options

(use-package all-the-icons)

;;(use-package doom-themes
;;  :init (load-theme 'doom-palenight t))

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


(provide 'bjl-theme)
