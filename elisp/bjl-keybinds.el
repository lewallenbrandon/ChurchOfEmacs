;; Keybinding Stuff
;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(evil-set-initial-state 'dired-mode 'emacs)
(use-package general
  :after evil
  :config
  (general-create-definer bjl/leader-keys
    :keymaps '(normal insert visual emacs)
    :prefix "SPC"
    :global-prefix "C-M-SPC")
  (bjl/leader-keys
    "<SPC>" '(evil-ex :which-key t)
    "<RET>" '(execute-extended-command :which-key t)
    
    "b" '(:ignore t :which-key "Buffers" )
	"bm" '("Menu Buffer" . consult-buffer)
	"bp" '("Previous Buffer" . previous-buffer )
	"bn" '("Next Buffer" . next-buffer )
	"bo" '("Menu Buffer (Other Window)" . consult-buffer-other-window)

    "B" '(:ignore t :which-key "Bookmarks" )
	"Bd" '("Delete" . bookmark-delete)
	"Bm" '("Menu" . consult-bookmark)
	"Bs" '("Set" . bookmark-set)
	"Bf" '(:ignore t :which-key "File" )
	    "Bfs" '("Save" . bookmark-save)
	    "Bfl" '("Load" . bookmark-load)

    "c" '(:ignore t :which-key "Code")
    "ca" '("Action" . lsp-execute-code-action)
    "cd" '("Definition" . lsp-find-definition)
    "cD" '(:ignore t :which-key "Debug")
        "cD <RET>" '("Start" . dap-debug)
        "cDb" '("Buffer" . dap-debug-buffer)
        "cDl" '("Last" . dap-debug-last)
        "cDr" '("Recent" . dap-debug-recent)
        "cDt" '("Template" . dap-debug-template)
    "ch" '("Hover" . lsp-ui-doc-toggle)
    "cr" '("References" . lsp-find-references)
    "cs" '("Symbol" . lsp-find-symbol)
    "ct" '("Type" . lsp-find-type-definition)
    "cw" '("Workspace" . lsp-find-workspace-symbol)

    "f" '(:ignore t :which-key "Find")
	"ff" '("Open" . consult-find)
    "f/" '("Search" . consult-isearch-history)
    "fm" '("Macros" . consult-kmacro)
    "fs" '("String" . consult-line)
    "fg" '("Registers" . consult-register)

    "F" '(:ignore t :which-key "Files")
	"Fc" '("Copy" . copy-file) 
	"Fd" '("Delete" . delete-file) 
	"Fn" '("New" . find-file) 
	"Fr" '("Rename" . rename-file) 

    "g" '(:ignore t :which-key "Git")
	"gb" '("Blame" . magit-blame)
	"gd" '("Dispatch" . magit-dispatch)
	"gf" '("File Git" . magit-file-dispatch)
	"go" '("Open Git" . magit) 
	"gp" '("Project Git" . magit-project-status)

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


    "o" '(:ignore t :which-key "Org")
	"oa" '("Agenda" . org-agenda)
	"oc" '("Capture" . org-capture)

	"of" '(:ignore t :which-key "Files")
	    "ofa" `("Agenda" . (lambda () (interactive) (dired ,org-dir)))
	    "ofb" `("Books" . (lambda () (interactive) (dired ,org-book-notes)))
	    "ofm" `("Meetings" . (lambda () (interactive) (dired ,org-meeting-notes)))
	    "ofM" `("Misc" . (lambda () (interactive) (dired ,org-misc-notes)))
	    "ofp" `("Presentations" . (lambda () (interactive) (dired ,org-presentation-notes)))
	    "ofe" `("Exports" . (lambda () (interactive) (dired ,org-exports-dir)))
	    "ofj" `("Journal" . (lambda () (interactive) (find-file ,org-journal-notes))) 
	    "ofr" '("Refresh Agenda" . refresh-org-agenda-files) 
	    "oft" `("Templates" . (lambda () (interactive) (dired ,org-templates-dir))) 

	"os" '(:ignore t :which-key "Store")
	    "osl" '("Link" . org-store-link)


    "p" '(:ignore t :which-key "Project")
	"pb" '("Buffers" . consult-project-buffer)
	"pd" `("Dired" . (lambda () (interactive) (dired (project-root (project-current t))))) 
	
	"pf" '(:ignore t :which-key "Find")
	    "pff" '("Find File" . project-find-file) 
	    "pfd" '("Find Dir" . project-find-dir) 

	"pm" '("Magit" . magit-project-status) 
	"ps"  '("Switch Project" . project-switch-project) 

    "r" '(:ignore t :which-key "Ripgrep")
    "rs" '("String" . consult-ripgrep)

    "s" '(:ignore t :which-key "Shell")
	"sc" '("Command". eshell-command)
	"so" '("eShell" . eshell)
	"sp" '("eShell Project" . project-eshell) 
    "sr" '("Rerun Last Command" . eshell-rerun-last-command)

    "t" '(:ignore t :which-key "Tabs" )
	"to" '("Open Tab" . tab-new )
	"tx" '("Close Tab" . tab-close )
	"tn" '("Next Tab" . tab-next )
	"tp" '("Previous Tab" . tab-previous )
	"tm" '("Menu Tab" . tab-switcher )

    "u" '(:ignore t :which-key "Utilities" )
        "ue" '(:ignore t :which-key "Evaluate")
        "ueb" '("Buffer" . eval-buffer)
        "ued" '("Defun" . eval-defun)
        "uee" '("Expression" . eval-expression)
        "uer" '("Region" . eval-region)
        "ues" '("Sexp" . eval-last-sexp)
	"uc" '(:ignore t :which-key "Clipboard" )
	    "ucy" '("Yank" . copy-to-x-clipboard)
	    "ucp" '("Paste" . paste-from-x-clipboard)
	"uk" '("Kill Ring Paste" . yank-pop)
	"uz" '("Zoom In/Out" . hydra-text-scale/body)
	"uC" '(:ignore t :which-key "Config Files" )
	    "uCe" `("Elisp Dir" . (lambda () (interactive) (dired ,dotemacs-elisp-dir)))
	    "uCi" `("init.el" . (lambda () (interactive) (find-file ,dotemacs-init))) 

    "w" '(:ignore t :which-key "Windows")
	"wv" '("Vertical Split" . split-window-vertically-and-focus)
	"wh" '("Horizontal Split" . split-window-horizontally-and-focus)
	"wx" '("Close Window" . evil-window-delete)
    )

  ;; DAP Keybindings
  (general-define-key 
    :keymaps 'dap-mode-map
    "<f5>" 'dap-continue
    "<f10>" 'dap-next
    "<f11>" 'dap-step-in
    "<f12>" 'dap-step-out
    "C-<f5>" 'dap-disconnect
    "<f8>" 'dap-breakpoint-toggle
    "C-<f8>" 'dap-breakpoint-condition
    "S-<f8>" 'dap-breakpoint-log-message
    )

  ;; Dired and Dired-X Keybindings
  (general-define-key 
    :keymaps 'dired-mode-map
    "j" 'dired-next-line
    "k" 'dired-previous-line
    "/" 'evil-search-forward
    "n" 'evil-search-next
    "N" 'evil-search-previous
    )

   


  ;; Org Mode Keybindings in Normal, Visual, and Emacs 
  (general-define-key 
    :keymaps 'org-mode-map
    :states 'normal
    :prefix "SPC"

	"oe" '("Export" . org-export-dispatch)
	"od" '(:ignore t :which-key "Delete")
	    "odl" '("Link" . org-delete-link)

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

	"oT" '("Tag" . org-set-tags-command)
	"ot" '("Todo State" . org-todo)

	"ox" '(:ignore t :which-key "Execute")
	    "oxb" '("Buffer" . org-babel-execute-buffer)
	    "oxs" '("Source" . org-babel-execute-src-block)
	    "oxt" '("Tree" . org-babel-execute-subtree)
    )

  (general-create-definer bjl/global-keys
    :keymaps '(normal visual emacs))
  (bjl/global-keys
    "<up>" '(evil-window-up 1 :which-key "Top Window")
    "<down>" '(evil-window-down 1 :which-key "Top Window")
    "<left>" '(evil-window-left 1 :which-key "Top Window")
    "<right>" '(evil-window-right 1 :which-key "Top Window")
    "C-n" '(next-history-element :which-key "Next Completion")
    "C-p" '(previous-history-element :which-key "Previous Completion")
    "-" '((lambda () (interactive) (if (eq major-mode 'dired-mode) (dired-up-directory) (dired "."))) :which-key t))
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
	    (evil-local-set-key 'normal (kbd "C-<return>") 'org-insert-heading-and-promote)
	    (evil-local-set-key 'insert (kbd "C-<return>") 'org-insert-heading-and-promote)
	    (evil-local-set-key 'normal (kbd "M-<return>") 'org-insert-heading-at-level)
	    (evil-local-set-key 'insert (kbd "M-<return>") 'org-insert-heading-at-level)
	    (evil-local-set-key 'normal (kbd "C-M-<return>") 'org-insert-heading-and-demote)
	    (evil-local-set-key 'insert (kbd "C-M-<return>") 'org-insert-heading-and-demote)
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
