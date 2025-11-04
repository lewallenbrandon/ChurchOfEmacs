;; Custom Functions

;; ORG MODE FUNCTIONS 

;; Org Theming Stuff
(defun toggle-org-custom-inline-style ()
  (interactive)
  (let ((hook 'org-export-before-parsing-hook)
        (fun 'set-org-html-style))
    (if (memq fun (eval hook))
        (progn
          (remove-hook hook fun 'buffer-local)
          (message "Removed %s from %s" (symbol-name fun) (symbol-name hook)))
      (add-hook hook fun nil 'buffer-local)
      (message "Added %s to %s" (symbol-name fun) (symbol-name hook)))))
 
(defun org-theme ()
  (interactive)
  (let* ((cssdir org-css-dir)
         (css-choices (directory-files cssdir nil ".css$"))
         (css (completing-read "theme: " css-choices nil t)))
    (concat cssdir css)))

(defun org-change-html-theme ()
  (interactive)
  (let* ((cssdir org-css-dir)
	 (css-choices (directory-files cssdir nil ".css$"))
	 (css (completing-read "theme: " css-choices nil t)))
    (setq org-theme-css (concat cssdir css))
    (org-set-html-theme)))
 
(defun org-set-html-theme (&optional backend)
  (interactive)
  (when (or (null backend) (eq backend 'html))
    (let ((f (or (and (boundp 'org-theme-css) org-theme-css) (org-theme))))
      (if (file-exists-p f)
          (progn
            (set (make-local-variable 'org-theme-css) f)            
            (set (make-local-variable 'org-html-head)
                 (with-temp-buffer
                   (insert "<style type=\"text/css\">\n<!--/*--><![CDATA[/*><!--*/\n")
                   (insert-file-contents f)
                   (goto-char (point-max))
                   (insert "\n/*]]>*/-->\n</style>\n")
                   (buffer-string)))
            (set (make-local-variable 'org-html-head-include-default-style)
                 nil)
            (message "Set custom style from %s" f))
        (message "Custom header file %s doesnt exist")))))

;; Org Refresh Agenda
(defun refresh-org-agenda-files ()
   (interactive)
   (setq org-agenda-files (directory-files-recursively "~/org" "org$")))

;; Insert a heading and then promote it
(defun org-insert-heading-and-promote ()
  (interactive)
  ;; Check if the heading we're under is level 10
  (let ((level (org-current-level)))
       (if (eq level 10)
	   ;; If it is, then we need to move up a level))
	   (org-up-heading-safe)
	 ))

  (org-insert-heading)
  (org-promote)
  )

;; Insert a heading and then promote it
(defun org-insert-heading-at-level ()
  (interactive)
  ;; Check if the heading we're under is level 10
  (let ((level (org-current-level)))
       (if (eq level 10)
	   ;; If it is, then we need to move up a level))
	   (org-up-heading-safe)
	 ))
  (let* ((e (save-excursion (beginning-of-line) (org-element-at-point))))
      ;; Check we're really on a line with a bullet.
      (if (memq (org-element-type e) '(item plain-list))
	  (org-insert-item)
	  (org-insert-heading))
  ))


(defun org-insert-heading-and-demote ()
  (interactive)
  ;; Check if the heading we're under is level 10
  (let ((level (org-current-level)))
       (if (eq level 10)
	   ;; If it is, then we need to move up a level))
	   (org-up-heading-safe)
	 ))
  (org-insert-heading)
  (org-demote)
  )

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
    (setq org-images-subdir-cache (file-name-directory file-path)) ;; We update in case they changed dirs
    ))
  )

;; Create a 10 asterisk heading that prompts the user for a name and definition
(defun org-insert-definition ()
  (interactive)
  (evil-open-below 1)
  (let ((term (read-string "Term: "))
	(definition (read-string "Definition: ")))
    (insert (format "********** *%s* - %s :definition:" term definition))))

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


;; Eshell Functions

;; Rerun the last eshell command
(defun eshell-rerun-last-command ()
  (interactive)
  (with-current-buffer (get-buffer "*eshell*")
    (eshell-return-to-prompt)
    (eshell-previous-input 1)
    (eshell-send-input)
    ))

(provide 'bjl-custom-functions)
