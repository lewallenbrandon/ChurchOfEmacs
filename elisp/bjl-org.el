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
  `(setq org-default-notes-file ,org-personal-notes)

  `(setq org-agenda-files (directory-files-recursively ,org-dir "org$"))
  (require 'org-habit)
  (require 'doct)
  (require 'ox-md)
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

  (defun capture-report-date-file (path) (let ((name (read-string "Name: "))) (expand-file-name (format "%s.org"  name) path)))

  (setq org-capture-templates
	(doct `(("Programming" :keys "p"
		 :children
		 (("Outline"
		   :keys "o"
		   :function (lambda () (find-file (capture-report-date-file org-dir)))
		   :type plain
		   :template-file  ,org-templates-project-outline)
		  ("Code Snippet"
		   :keys "c"
		   :file (lambda () (place-snippet-new))
		   :function (lambda () (let ((org-goto-interface 'outline-path-completion)) (org-goto)))
		   :type entry
		   :template-file ,org-templates-code-snippet)
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

;; I prefer the exports to go to its own subdirectory
(defun org-export-output-file-name-modified (orig-fun extension &optional subtreep pub-dir)
  (unless pub-dir
    (setq pub-dir "~/org_exports/")
    (unless (file-directory-p pub-dir)
      (make-directory pub-dir)))
  (apply orig-fun extension subtreep pub-dir nil))
(advice-add 'org-export-output-file-name :around #'org-export-output-file-name-modified)


(add-hook 'org-mode-hook (lambda () (add-hook 'after-save-hook #'bjl/org-babel-tangle-config)))

(provide 'bjl-org)
