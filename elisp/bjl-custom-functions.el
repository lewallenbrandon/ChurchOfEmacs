;; Custom Functions

(defun my-org-faces ()
  (set-face-attribute 'org-todo nil :height 0.8)
  (set-face-attribute 'org-level-1 nil :height 2.0)
  (set-face-attribute 'org-level-2 nil :height 1.8)
  (set-face-attribute 'org-level-3 nil :height 1.6)
  (set-face-attribute 'org-level-4 nil :height 1.4)
  (set-face-attribute 'org-level-5 nil :height 1.2))

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

(defun place-snippet ()
  (interactive)
  (let ((file-list (directory-files-recursively "~/org" "org$")))
    (if file-list
	(let ((chosen-file (completing-read "Choose file: " file-list nil t)))
	  (set-buffer (org-capture-target-buffer chosen-file))
	  (goto-char (point-max)))
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

(provide 'bjl-custom-functions)
