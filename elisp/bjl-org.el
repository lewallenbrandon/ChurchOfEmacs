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
  (setq org-export-with-broken-links 1)
  (setq org-default-notes-file org-journal-notes)

  (setq org-agenda-files  (directory-files-recursively org-notes-dir "org$"))


  
  (require 'org-habit)
  (require 'doct)
  (require 'ox-md)
  (add-to-list 'org-modules 'org-habit)
  (setq org-habit-graph-column 60)

  (setq org-todo-keywords
	'((sequence "TODO(t)" "IN PROGRESS(i@/!)" "|" "DONE(d@/!)" "ABANDONED(a@)")))

  (setq org-tag-alist
	'(("@personal" . ?H)
	  ("@work" . ?W)
	  ("idea" . ?i)
	  ("definition" . ?d)
	  )
	)
  )

(with-eval-after-load 'org
  (require 'org-tempo)

  (add-to-list 'org-structure-template-alist '("sh" . "src shell"))
  (add-to-list 'org-structure-template-alist '("rs" . "src rust"))
  (add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
  (add-to-list 'org-structure-template-alist '("py" . "src python"))
  (add-to-list 'org-structure-template-alist '("ltx" . "src latex"))
  (add-to-list 'org-structure-template-alist '("cpp" . "src C++"))

  (org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp . t)
     (python . t)
     (shell . t)
     (C . t)))

  ;;(global-org-modern-mode)

  (defun capture-report-date-file (path) (let ((name (read-string "Name: "))) (expand-file-name (format "%s.org"  name) path)))

  (setq org-capture-templates
	(doct `(

		("Outline"
		   :keys "o"
		   :function (lambda () (find-file (capture-report-date-file org-dir)))
		   :type plain
		   :template-file  ,org-templates-project-outline)

		("Book Notes"
		   :keys "b"
		   :function (lambda () (find-file (capture-report-date-file org-dir)))
		   :type plain
		   :template-file  ,org-templates-book-notes)

		  ("Code Snippet"
		   :keys "c"
		   :file (lambda () (place-snippet-new))
		   :function (lambda () (let ((org-goto-interface 'outline-path-completion)) (org-goto)))
		   :type entry
		   :template-file ,org-templates-code-snippet)

		  ("Minimal"
		   :keys "m"
		   :function (lambda () (find-file (capture-report-date-file org-dir)))
		   :type plain
		   :template-file ,org-templates-minimal)

		 )
	      )
	)





  (push '("conf-unix" . conf-unix) org-src-lang-modes))

;; I prefer the exports to go to its own subdirectory
(defun org-export-output-file-name-modified (orig-fun extension &optional subtreep pub-dir)
  (unless pub-dir
    (setq pub-dir org-exports-dir)
    (unless (file-directory-p pub-dir)
      (make-directory pub-dir)))
  (apply orig-fun extension subtreep pub-dir nil))
(advice-add 'org-export-output-file-name :around #'org-export-output-file-name-modified)


(provide 'bjl-org)
