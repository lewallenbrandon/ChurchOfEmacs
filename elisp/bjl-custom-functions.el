;; Custom Functions

;; ORG MODE FUNCTIONS 

(defun refresh-org-agenda-files ()
   (interactive)
   (setq org-agenda-files (directory-files-recursively "~/org" "org$")))

;; Create a function that inserts a link through file selection
(defun org-insert-image-link ()
  (interactive)
  ;; Check if org-images-subdir-cache is not nil
  (if (not org-images-subdir-cache)
      ;; Prompt the user for the file that they want to insert
      (let ((file-path (read-file-name "File: " "~/org-images/")
		       )
	    )
	;; Insert the link
	(insert (format "[[%s]]" file-path))
	;; Update the org-images-subdir-cache with the directory of the file
	(setq org-images-subdir-cache (file-name-directory file-path)))
  ;; else we have a cache, so we can ask them which file in that directory
  (let ((file-path (read-file-name "File: " org-images-subdir-cache)))
    (insert (format "[[%s]]" file-path))
    (setq org-images-subdir-cache (file-name-directory file-path))
    ))
  )

;; Create a 10 asterisk heading that prompts the user for a name and definition
(defun org-insert-definition ()
  (interactive)
  (let ((name (read-string "Term: "))
	(definition (read-string "Definition: ")))
    (insert (format "********** %s - %s :definition:" name definition))))

;; Create a function that takes all 10 asterisk headings and refiles them to the Glossary heading
(defun org-refile-definitions ()
  (interactive)
  (org-map-entries 'org-refile-to-glossary "definition" 'file)
  )

(defun org-clear-glossary ()
  (interactive)
  (org-goto-glossary-headline)
  (org-clear-subtree)
  )

(defun org-goto-glossary-headline ()
  (interactive)
  (let ((pos (save-excursion (org-find-exact-headline-in-buffer "Glossary"))
	     )
	)
    (goto-char pos)
    )
  )

(defun org-refile-to-glossary () 
  ;; Get the current file path
  (interactive)
  (let ((pos (save-excursion
	       (org-find-exact-headline-in-buffer "Glossary")
	       )
	     )
	)
    ;; Move to position
    (let ((org-refile-keep t))
      (org-refile nil nil (list "Glossary" (buffer-file-name) nil pos) "Copy")
      )
    )
  )

(defun org-clear-subtree ()
  (interactive)
  (org-mark-subtree) ;; mark the current subtree
  (forward-line) ;; move point forward, so the headline isn't in the region
  (delete-region (region-beginning) (region-end)) ;; delete the rest
)

(defun my-org-faces ()
  (set-face-attribute 'org-todo nil :height 0.8)
  (set-face-attribute 'org-level-1 nil :height 2.0)
  (set-face-attribute 'org-level-2 nil :height 1.8)
  (set-face-attribute 'org-level-3 nil :height 1.6)
  (set-face-attribute 'org-level-4 nil :height 1.4)
  (set-face-attribute 'org-level-5 nil :height 1.2))

(defun place-snippet-new ()
  (interactive)
  (let ((file-list (directory-files-recursively "~/org" "org$")))
    (if file-list
	(let ((chosen-file (completing-read "Choose file: " file-list nil t)))
	  (message "%s" chosen-file))
      (message "No files found in specified directory."))))

(defun get-value-from-extension ()
  "Return a value based on the extension of the current buffer's file."
  (interactive)
  (let ((extension (file-name-extension (org-capture-get :original-file))))
    (cond
     ((string-equal extension "cpp") "cpp")
     ((string-equal extension "el") "emacs-lisp")
     ((string-equal extension "org") "org")
     ((string-equal extension "py") "python")
     )))

(defun open-new-project-file ()
  (interactive)
   (let ((fpath (read-file-name "File name: "
				"~/org/"
				nil nil nil)))))

(provide 'bjl-custom-functions)
