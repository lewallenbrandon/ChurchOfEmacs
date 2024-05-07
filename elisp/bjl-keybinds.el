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

    "d" '(:ignore t :which-key "Directory") ;; Directory
	"do" '("Open" . ranger) 

    "e" '(:ignore t :which-key "Evaluate")
	"eb" '("Buffer" . eval-buffer)
	"ed" '("Defun" . eval-defun)
	"ee" '("Expression" . eval-expression)
	"er" '("Region" . eval-region)
	"es" '("Sexp" . eval-last-sexp)

    "f" '(:ignore t :which-key "Files")
	"fc" '("Copy" . copy-file) 
	"fd" '("Delete" . delete-file) 
	"fo" '("Open" . find-file)
	"fr" '("Rename" . rename-file) 

    "h" '(:ignore t :which-key "Help" ) 
	"hb" '("Describe Bindings" . embark-bindings)
	"hc" '("Describe Command" . helpful-command )
	"hf" '("Describe Function" . describe-function)
	"hk" '("Describe Key" . helpful-key)
	"hm" '("Describe Mode" . describe-mode)
	"hp" '("Describe Package" . describe-package)
	"hr" '("Repeat Cmd" . repeat-complex-command)
	"hv" '("Describe Variable" . describe-variable)

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
	"od" '(:ignore t :which-key "Delete")
	    "odl" '("Link" . org-delete-link)

	"of" '(:ignore t :which-key "Files")
	    "ofa" `("Agenda" . (lambda () (interactive) (ranger ,org-dir)))
	    "ofe" `("Exports" . (lambda () (interactive) (ranger ,org-exports-dir)))
	    "ofp" `("Personal" . (lambda () (interactive) (find-file ,org-personal-notes))) 
	    "ofr" '("Refresh Agenda" . refresh-org-agenda-files) 
	    "oft" `("Templates" . (lambda () (interactive) (ranger ,org-templates-dir))) 

	"oG" '(:ignore t :which-key "Glossary")
	    "oGc" '("Clear" . org-clear-glossary)
	    "oGp" '("Populate" . org-refile-definition)

	"oh" '(:ignore t :which-key "HTML Themes")
	    "ohc" '("Change" . org-change-html-theme)
	    "ohp" '("Set" . org-set-html-theme)

	"oi" '(:ignore t :which-key "Insert")
	    "oid" '("Definition" . (lambda () (interactive) (org-insert-definition)))
	    "oii" '("Image" . org-insert-image-link)
	    "oil" '("Link" . org-insert-link) 
	    "oin" '("Note" . org-add-note)

	"oo" '("Outline" . (lambda () (interactive) (consult-org-heading "-definition" nil)))
	"or" '("Refile" . org-refile)

	"os" '(:ignore t :which-key "Store")
	    "osl" '("Link" . org-store-link)

	"oT" '("Tag" . org-set-tags-command)
	"ot" '("Todo" . org-todo)

	"ox" '(:ignore t :which-key "Execute")
	    "oxb" '("Buffer" . org-babel-execute-buffer)
	    "oxs" '("Source" . org-babel-execute-src-block)
	    "oxt" '("Tree" . org-babel-execute-subtree)

    "p" '(:ignore t :which-key "Project")
	"pb" '("Buffers" . consult-project-buffer)
	"pd" `("Dired" . (lambda () (interactive) (ranger (project-root (project-current t))))) 
	
	"pf" '(:ignore t :which-key "Find")
	    "pff" '("Find File" . project-find-file) 
	    "pfd" '("Find Dir" . project-find-dir) 

	"pg" '("Grep" . consult-ripgrep)
	"pm" '("Magit" . magit-project-status) 
	"ps"  '("Switch Project" . project-switch-project) 

    "s" '(:ignore t :which-key "Shell")
	"sc" '("Command". eshell-command)
	"so" '("eShell" . eshell)
	"sp" '("eShell Project" . project-eshell) 

    "t" '(:ignore t :which-key "Tabs" )
	"to" '("Open Tab" . tab-new )
	"tx" '("Close Tab" . tab-close )
	"tn" '("Next Tab" . tab-next )
	"tp" '("Previous Tab" . tab-previous )
	"tm" '("Menu Tab" . tab-switcher )

    "u" '(:ignore t :which-key "Utilities" )
	"uc" '(:ignore t :which-key "Clipboard" )
	    "ucy" '("Yank" . copy-to-x-clipboard)
	    "ucp" '("Paste" . paste-from-x-clipboard)
	"uk" '("Kill Ring Paste" . yank-pop)
	"uz" '("Zoom In/Out" . hydra-text-scale/body)
	"uC" '(:ignore t :which-key "Config Files" )
	    "uCe" `("Elisp Dir" . (lambda () (interactive) (ranger ,dotemacs-elisp-dir)))
	    "uCi" `("init.el" . (lambda () (interactive) (find-file ,dotemacs-init))) 

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
    "<right>" '(evil-window-right 1 :which-key "Top Window")
    "M-n" '(next-history-element :which-key "Next Completion")
    "M-p" '(previous-history-element :which-key "Previous Completion"))
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
	    (evil-local-set-key 'normal (kbd "C-M-<return>") 'org-insert-heading-and-promote)
	    (evil-local-set-key 'insert (kbd "C-M-<return>") 'org-insert-heading-and-promote)
	    (evil-local-set-key 'normal (kbd "M-<return>") 'org-insert-heading-at-level)
	    (evil-local-set-key 'insert (kbd "M-<return>") 'org-insert-heading-at-level)
	    (evil-local-set-key 'normal (kbd "C-<return>") 'org-insert-heading-and-demote)
	    (evil-local-set-key 'insert (kbd "C-<return>") 'org-insert-heading-and-demote)
	    ))

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

(use-package evil-numbers)
(define-key evil-normal-state-map (kbd "C-a") 'evil-numbers/inc-at-pt)
(define-key evil-normal-state-map (kbd "C-d") 'evil-numbers/dec-at-pt)
(evil-set-undo-system 'undo-redo)

(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))

(provide 'bjl-keybinds)
