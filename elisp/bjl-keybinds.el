;; Keybinding Stuff
;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(use-package general
  :after evil
  :config
  (general-create-definer bjl/leader-keys
    :keymaps '(normal insert visual emacs)
    :prefix "SPC"
    :global-prefix "C-M-SPC")
  (bjl/leader-keys
    "<SPC>" '("M-x" . execute-extended-command)
    
    "b" '(:ignore t :which-key "Buffers" )
	"bm" '("Menu Buffer" . consult-buffer)
	"bp" '("Previous Buffer" . previous-buffer )
	"bn" '("Next Buffer" . next-buffer )

    "B" '(:ignore t :which-key "Bookmarks" )
	"Bd" '("Delete" . bookmark-delete)
	"Bm" '("Menu" . consult-bookmark)
	"Bs" '("Set" . bookmark-set)
	"Bf" '(:ignore t :which-key "File" )
	    "Bfs" '("Save" . bookmark-save)
	    "Bfl" '("Load" . bookmark-load)

    "d" '(:ignore t :which-key "Dired") ;; Directory
	"dj" '("Jump" . dired-jump) 
	"do" '("Open" . dired) 

    "f" '(:ignore t :which-key "Files")
	"fc" '("Copy" . copy-file) 
	"fd" '("Delete" . delete-file) 
	"fo" '("Open" . find-file)
	"fr" '("Rename" . rename-file) 

    "k" '(:ignore t :which-key "Kill")
	"kb" '(:ignore t :which-key "Buffers")
	    "kba" '("All" . kill-some-buffers)
	    "kbc" '("Current" . kill-this-buffer)
	    "kbm" '("Menu" . kill-buffer)
	    "kbo" '("Org Agenda" . org-agenda-kill-all-agenda-buffers)
	"ke" '("Emacs" . kill-emacs)
    
    "m" '(:ignore t :which-key "Magit")
	"mb" '("Blame" . magit-blame)
	"md" '("Dispatch" . magit-dispatch)
	"mf" '("File Git" . magit-file-dispatch)
	"mo" '("Open Git" . magit) 
	"mp" '("Project Git" . magit-project-status)

    "o" '(:ignore t :which-key "Org")
	"oa" '("Agenda" . org-agenda)
	"oc" '("Capture" . org-capture)
	"oe" '("Export" . org-export-dispatch)

	"of" '(:ignore t :which-key "Files")
	    "ofa" `("Agenda" . (lambda () (interactive) (dired ,org-dir)))
	    "ofe" `("Exports" . (lambda () (interactive) (dired ,org-exports-dir)))
	    "ofp" `("Personal" . (lambda () (interactive) (find-file ,org-personal-notes))) 
	    "ofr" '("Refresh Agenda" . refresh-org-agenda-files) 
	    "oft" `("Templates" . (lambda () (interactive) (dired ,org-templates-dir))) 

	"og" '("Go to all" . consult-org-heading)

	"ol" '(:ignore t :which-key "Links")
	    "oli" '("Insert" . org-insert-link) 
	    "ols" '("Store" . org-store-link) 

	    "oo" '("Outline" . consult-outline)

	"on" '("Note" . org-add-note)
	"or" '("Refile" . org-refile)
	"ot" '("Tag" . org-set-tags-command)

    "p" '(:ignore t :which-key "Project")
	"pd" '("Dired" . projectile-dired) 
	"pf" '(:ignore t :which-key "Find")
	    "pff" '("Find File" . projectile-find-file) 
	    "pfd" '("Find Dir" . projectile-find-dir) 
	    "pg" '("Grep" . projectile-rg) 
	    "pm" '("Magit" . magit-project-status) 
	    "pr" '("Replace" . projectile-replace) 
	    "pS"  '("Switch Project" . projectile-switch-project) 
	    "ps"  '("Shell" . projectile-run-eshell) 

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
	"uz" '("Zoom In/Out" . hydra-text-scale/body)

	"ue" '(:ignore t :which-key "Evaluate")
	    "ueb" '("Buffer" . eval-buffer)
	    "ued" '("Defun" . eval-defun)
	    "uee" '("Expression" . eval-expression)
	    "uer" '("Region" . eval-region)
	    "ues" '("Sexp" . eval-last-sexp)

	"uh" '(:ignore t :which-key "Help" ) 
	    "uhc" '("Describe Command" . helpful-command )
	    "uhf" '("Describe Function" . describe-function)
	    "uhk" '("Describe Key" . helpful-key)
	    "uhm" '("Describe Mode" . describe-mode)
	    "uhp" '("Describe Package" . describe-package)
	    "uhr" '("Repeat Cmd" . repeat-complex-command)
	    "uhv" '("Describe Variable" . describe-variable)

	"uhC" '(:ignore t :which-key "Config Files" )
	    "uhCe" `("Elisp Dir" . (lambda () (interactive) (dired ,dotemacs-elisp-dir)))
	    "uhCi" `("init.el" . (lambda () (interactive) (find-file ,dotemacs-init))) 

    "w" '(:ignore t :which-key "Windows")
	"wv" '("Vertical Split" . split-window-vertically-and-focus)
	"wh" '("Horizontal Split" . split-window-horizontally-and-focus)
	"wx" '("Close Window" . evil-window-delete)


    )



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

(add-hook 'org-mode-hook
          (lambda ()
            (evil-local-set-key 'normal (kbd "C-<return>") 'org-insert-subheading)))

(add-hook 'org-mode-hook
          (lambda ()
            (evil-local-set-key 'insert (kbd "C-<return>") 'org-insert-subheading)))

(use-package which-key
  :defer 0
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0)
  (setq which-key-idle-secondary-delay 0)
  (which-key-mode))

(use-package drag-stuff)
(define-key evil-visual-state-map (kbd "K") 'drag-stuff-up)
(define-key evil-visual-state-map (kbd "J") 'drag-stuff-down)

(provide 'bjl-keybinds)
