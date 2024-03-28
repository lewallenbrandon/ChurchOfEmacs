;; Default Settings

(defvar bjl/default-font-size 140)
(defvar bjl/default-variable-font-size 140)
(defvar bjl/frame-transparency '(90 . 90))
(display-time-mode +1)

;;(add-hook 'org-mode-hook #'my-org-faces)
;; no-littering doesn't set this by default so we must place
;; auto save files in the same path as it uses for sessions
(setq auto-save-file-name-transforms
      `((".*" ,(no-littering-expand-var-file-name "auto-save/") t)))

(setq inhibit-startup-message t)

(setq display-line-numbers-type 'relative) ; Relatively and Absolutely Correct way to Display Line Numbers
(global-display-line-numbers-mode 1) ; Display the Line Numbers
(scroll-bar-mode -1)        ; Disable visible scrollbar
(tool-bar-mode -1)          ; Disable the toolbar
(tooltip-mode -1)           ; Disable tooltips
(set-fringe-mode 10)        ; Give some breathing room

(menu-bar-mode -1)            ; Disable the menu bar

;; Set up the visible bell
(setq visible-bell nil)

(column-number-mode)

;; Set frame transparency
;;(set-frame-parameter (selected-frame) 'alpha bjl/frame-transparency)
;;(add-to-list 'default-frame-alist `(alpha . ,bjl/frame-transparency))
(set-frame-parameter (selected-frame) 'fullscreen 'maximized)
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(set-face-attribute 'default nil :font "Jetbrains Mono" :height bjl/default-font-size)

;; Set the fixed pitch face
(set-face-attribute 'fixed-pitch nil :font "Jetbrains Mono" :height bjl/default-font-size)

(defadvice find-file (before make-directory-maybe (filename &optional wildcards) activate)
  "Create parent directory if not exists while visiting file."
  (unless (file-exists-p filename)
    (let ((dir (file-name-directory filename)))
      (unless (file-exists-p dir)
        (make-directory dir t)))))


(setq auto-save-file-name-transforms '((".*" "~/.emacs-saves/" t)))
(setq backup-directory-alist '(("." . "~/.emacs-backups/")))
(setq initial-major-mode 'org-mode)

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package eterm-256color
  :hook (term-mode . eterm-256color-mode))

(provide 'bjl-defaults)
