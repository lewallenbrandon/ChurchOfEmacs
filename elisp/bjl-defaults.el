;; Default Settings

;; auto save files in the same path as it uses for sessions
(setq auto-save-file-name-transforms
      `((".*" ,(no-littering-expand-var-file-name "auto-save/") t)))
(setq auto-save-file-name-transforms '((".*" "~/.emacs-saves/" t)))
(setq backup-directory-alist '(("." . "~/.emacs-backups/")))
(setq initial-major-mode 'org-mode)

;; No start up message
(setq inhibit-startup-message t)

;; Hodge podge of settings
(setq display-line-numbers-type 'relative) ; Relatively and Absolutely Correct way to Display Line Numbers
(global-display-line-numbers-mode 1) ; Display the Line Numbers
(column-number-mode)        ; Display a column number 
(scroll-bar-mode -1)        ; Disable visible scrollbar
(tool-bar-mode -1)          ; Disable the toolbar
(tooltip-mode -1)           ; Disable tooltips
(set-fringe-mode 10)        ; Give some breathing room
(menu-bar-mode -1)          ; Disable the menu bar
(setq visible-bell nil)     ; Disable visible bell
(display-time-mode +1)      ; Time 


;; If I specify a path and it doesn't exist, well, make it exist.
(defadvice find-file (before make-directory-maybe (filename &optional wildcards) activate)
  "Create parent directory if not exists while visiting file."
  (unless (file-exists-p filename)
    (let ((dir (file-name-directory filename)))
      (unless (file-exists-p dir)
        (make-directory dir t)))))


(use-package eterm-256color
  :hook (term-mode . eterm-256color-mode))

(provide 'bjl-defaults)
