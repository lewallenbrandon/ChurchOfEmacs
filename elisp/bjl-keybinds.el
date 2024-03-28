;; Keybinding Stuff
;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(use-package general
  :after evil
  :config
  (general-create-definer bjl/leader-keys
    :keymaps '(normal insert visual emacs)
    :prefix "SPC"
    :global-prefix "C-SPC")
  (bjl/leader-keys
    "<SPC>" '("Counsel-M-x" . counsel-M-x)
    
    "b" '(:ignore t :which-key "Buffers" )
    "bm" '("Menu Buffer" . counsel-switch-buffer)
    "bp" '("Previous Buffer" . previous-buffer )
    "bn" '("Next Buffer" . next-buffer )

    "e" '(:ignore t :which-key "Evaluate")
    "ed" '("Defun" . eval-defun)
    "ee" '("Expression" . eval-expression)
    "er" '("Region" . eval-region)
    "es" '("Sexp" . eval-last-sexp)

    "k" '(:ignore t :which-key "Kill")
    "ke" '("Emacs" . kill-emacs)

    "f" '(:ignore t :which-key "Files")
    "fo" '("Open" . counsel-find-file) 

    "g" '(:ignore t :which-key "Git")
    "gs" '("Open" . magit) 

    "h" '(:ignore t :which-key "Help" ) 
    "hv" '("Describe Variable" . counsel-describe-variable)
    "hf" '("Describe Function" . counsel-describe-function)
    "hc" '("Describe Command" . helpful-command )
    "hk" '("Describe Key" . helpful-key )
    "hk" '("Describe Mode" . describe-mode)
    "hp" '("Describe Package" . describe-package)
    "hr" '("Repeat Cmd" . repeat-complex-command)
    "hC" '(:ignore t :which-key "Config Files" )
    "hCi" '("init.el" . (lambda () (interactive) (find-file "~/.emacs.d/init.el"))) 
    "hCd" '("Defaults" . (lambda () (interactive) (find-file "~/.emacs.d/elisp/bjl-defaults.el"))) 
    "hCk" '("Keybindings" . (lambda () (interactive) (find-file "~/.emacs.d/elisp/bjl-keybinds.el"))) 
    "hCo" '("Org" . (lambda () (interactive) (find-file "~/.emacs.d/elisp/bjl-org.el"))) 
    "hCp" '("Programming" . (lambda () (interactive) (find-file "~/.emacs.d/elisp/bjl-programming.el"))) 
    "hCt" '("Theme" . (lambda () (interactive) (find-file "~/.emacs.d/elisp/bjl-theme.el"))) 
    "hCu" '("Utility" . (lambda () (interactive) (find-file "~/.emacs.d/elisp/bjl-utility-packages.el"))) 
    
    "m" '(:ignore t :which-key "Marks")
    "mm" '("Menu" . counsel-evil-marks)

    "o" '(:ignore t :which-key "Org")
    "oa" '("Agenda" . org-agenda)
    "oc" '("Capture" . org-capture)
    "or" '("Refresh Agenda" . refresh-org-agenda-files) 
    "oN" '("Notes" . (lambda () (interactive) (find-file "~/org/Notes.org"))) 
    "ol" '(:ignore t :which-key "Links")
    "oli" '("Notes" . org-insert-link) 
    "ols" '("Notes" . org-store-link) 

    "p" '(:ignore t :which-key "Project")
    "pf" '("Find File" . counsel-projectile) 
    "pg" '("Grep" . counsel-projectile-rg) 
    "pr" '("Replace" . projectile-replace) 
    "pS"  '("Switch Project" . counsel-projectile-switch-project) 

    "s" '(:ignore t :which-key "Shell")
    "so" '("eShell" . eshell)
    "sc" '("Command". eshell-command)


    "t" '(:ignore t :which-key "Tabs" )
    "to" '("Open Tab" . tab-new )
    "tx" '("Close Tab" . tab-close )
    "tn" '("Next Tab" . tab-next )
    "tp" '("Previous Tab" . tab-previous )
    "tm" '("Menu Tab" . tab-switcher )

    "u" '(:ignore t :which-key "Utilities" )
    "uk" '("Kill Ring Paste" . yank-pop)

    "w" '(:ignore t :which-key "Windows")
    "wv" '("Vertical Split" . split-window-vertically-and-focus)
    "wh" '("Horizontal Split" . split-window-horizontally-and-focus)
    "wx" '("Close Window" . evil-window-delete)
    )

  (bjl/leader-keys
    "ts" '(hydra-text-scale/body :which-key "scale text"))


  (general-create-definer bjl/global-keys
    :keymaps '(normal visual emacs))
  (bjl/global-keys
    "<up>" '(evil-window-up 1 :which-key "Top Window")
    "<down>" '(evil-window-down 1 :which-key "Top Window")
    "<left>" '(evil-window-left 1 :which-key "Top Window")
    "<right>" '(evil-window-right 1 :which-key "Top Window"))
  )



(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump nil)
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)

  (defun split-window-vertically-and-focus ()
    "Split Window Vertically and focus"
    (interactive)
    (evil-window-vsplit)
    (windmove-right))

  (defun split-window-horizontally-and-focus ()
    "Split Window Vertically and focus"
    (interactive)
    (evil-window-split)
    (windmove-down))

  ;; Use visual line motions even outside of visual-line-mode buffers
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)

  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))


(use-package evil-org
  :after (evil org)
  :demand t

  :config
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))

(unless (display-graphic-p)
  (require 'evil-terminal-cursor-changer)
  (evil-terminal-cursor-changer-activate))

(use-package which-key
  :defer 0
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0)
  (setq which-key-idle-secondary-delay 0)
  (which-key-mode))


(provide 'bjl-keybinds)
