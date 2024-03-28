;; Theme Options

(use-package all-the-icons)

;;(use-package doom-themes
;;  :init (load-theme 'doom-palenight t))

(add-to-list 'load-path "~/.emacs.d/modus-themes")
(require 'modus-themes)
(load-theme 'modus-vivendi-tinted :no-confirm)

(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))


(provide 'bjl-theme)
