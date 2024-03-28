;; Org Beauty
(use-package doct
  :ensure t
  ;;recommended: defer until calling doct
  :commands (doct))

(use-package org
  :pin org
  :commands (org-capture org-agenda)
  :config
  (setq org-ellipsis " ▾")
  (setq org-auto-align-tags nil)
  (setq org-tags-column 0)
  (setq org-pretty-entities t)
  (setq org-startup-indented 1)
  (setq org-insert-heading-respect-content t)
  (setq org-refile-targets '((nil :maxlevel . 9)
			     (org-agenda-files :maxlevel . 9)))
  (setq org-outline-path-complete-in-steps nil)         ; Refile in a single go
  (setq org-refile-use-outline-path t)                  ; Show full paths for refiling

  (setq org-agenda-start-with-log-mode t)
  (setq org-export-coding-system 'utf-8)
  (setq org-log-done 'time)
  (setq org-log-into-drawer t)
  (setq org-default-notes-file "~/org/Notes.org")

  (setq org-agenda-files (directory-files-recursively "~/org" "org$"))

  (require 'org-habit)
  (require 'doct)
  (add-to-list 'org-modules 'org-habit)
  (setq org-habit-graph-column 60)

  ;; Save Org buffers after refiling!
  (advice-add 'org-refile :after 'org-save-all-org-buffers)

  (setq org-tag-alist
	'((:startgroup)
					; Put mutually exclusive tags here
	  (:endgroup)
	  ("@errand" . ?E)
	  ("@home" . ?H)
	  ("@work" . ?W)
	  ("agenda" . ?a)
	  ("planning" . ?p)
	  ("publish" . ?P)
	  ("batch" . ?b)
	  ("note" . ?n)
	  ("idea" . ?i))))

(with-eval-after-load 'org
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp . t)
     (python . t)))

  (with-eval-after-load 'org (global-org-modern-mode))

  (defvar org-templates "~/org_templates/")
  (defvar org-notes "~/org/")

  (defun capture-report-date-file (path) (let ((name (read-string "Name: "))) (expand-file-name (format "%s.org"  name) path)))

  ;; Not using Doct
  ;;(setq org-capture-templates
  ;;	`(("c" "Code" entry (function place-snippet) (file ,(concat org-templates "code_note.txt")))
  ;;        ("O" "Outline" plain (function ,(lambda () (find-file (capture-report-date-file "~/org/")))) (file ,(concat org-templates "project_outline.txt")))))
		 ;;("Code Snippet" :keys "c" :type entry :tempalte-file `(file ,(concat org-templates "code_snippet.txt")))

;;  (setq org-capture-templates
;;	(doct `(("Programming" :keys "p"
;;		 :file ,(lambda () (find-file (capture-report-date-file "~/org/"))) :children
;;		 (("Outline" :keys "o" :type plain :template-file "~/org_templates/project_outline.txt"))
;;		 ))
;;	      )
;;	)

  (defvar project_outline_template (concat org-templates "project_outline.txt"))
  (defvar code_snippet_template (concat org-templates "code_snippet.txt"))

  (setq org-capture-templates
	(doct '(("Programming" :keys "p"
		 :children
		 (("Outline"
		   :keys "o"
		   :function (lambda () (find-file (capture-report-date-file org-notes)))
		   :type plain
		   :template-file project_outline_template)
		  ("Code Snippet"
		   :keys "c"
		   :file (lambda () (place-snippet-new))
		   :function (lambda () (let ((org-goto-interface 'outline-path-completion)) (org-goto)))
		   :type plain
		   :template-file code_snippet_template)
		 )
		 ))
	      )
	)

  
  
  
  
  (push '("conf-unix" . conf-unix) org-src-lang-modes))

(with-eval-after-load 'org
  ;; This is needed as of Org 9.2
  (require 'org-tempo)

  (add-to-list 'org-structure-template-alist '("sh" . "src shell"))
  (add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
  (add-to-list 'org-structure-template-alist '("py" . "src python")))

;; Automatically tangle our Emacs.org config file when we save it
(defun bjl/org-babel-tangle-config ()
  (when (string-equal (file-name-directory (buffer-file-name))
                      (expand-file-name user-emacs-directory))
    ;; Dynamic scoping to the rescue
    (let ((org-confirm-babel-evaluate nil))
      (org-babel-tangle))))

(add-hook 'org-mode-hook (lambda () (add-hook 'after-save-hook #'bjl/org-babel-tangle-config)))

(provide 'bjl-org)
