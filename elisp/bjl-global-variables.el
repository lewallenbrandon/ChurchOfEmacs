;; Globals

(defvar dotemacs-dir "~/.emacs.d/")
(defvar dotemacs-init (concat dotemacs-dir "init.el"))
(defvar dotemacs-elisp-startup (concat dotemacs-elisp-dir "bjl-startup.el"))
(defvar dotemacs-elisp-package-management (concat dotemacs-elisp-dir "bjl-package-management.el"))
(defvar dotemacs-elisp-global-variables (concat dotemacs-elisp-dir "bjl-global-variables.el"))
(defvar dotemacs-elisp-custom-functions (concat dotemacs-elisp-dir "bjl-custom-functions.el"))
(defvar dotemacs-elisp-defaults (concat dotemacs-elisp-dir "bjl-defaults.el"))
(defvar dotemacs-elisp-keybinds (concat dotemacs-elisp-dir "bjl-keybinds.el"))
(defvar dotemacs-elisp-org (concat dotemacs-elisp-dir "bjl-org.el"))
(defvar dotemacs-elisp-utilities (concat dotemacs-elisp-dir "bjl-utilities.el"))
(defvar dotemacs-elisp-themes (concat dotemacs-elisp-dir "bjl-themes.el"))
(defvar dotemacs-elisp-programming (concat dotemacs-elisp-dir "bjl-programming.el"))
(defvar dotemacs-elisp-terminal (concat dotemacs-elisp-dir "bjl-terminal.el"))
(defvar dotemacs-elisp-finalize (concat dotemacs-elisp-dir "bjl-finalize.el"))

(defvar org-dir "~/org/")

(defvar org-templates-dir (concat org-dir "org-templates/"))
(defvar org-templates-code-snippet (concat org-templates-dir "code_snippet.txt"))
(defvar org-templates-book-notes (concat org-templates-dir "book_notes.txt"))
(defvar org-templates-project-outline (concat org-templates-dir "project_outline.txt"))
(defvar org-templates-minimal (concat org-templates-dir "minimal.txt"))
(defvar org-templates-workitem (concat org-templates-dir "work_item.txt"))

(defvar org-css-dir "~/org/org-css/")
(defvar org-exports-dir "~/org/org-exports/")

(defvar org-images-dir "~/org/org-images/")
(defvar org-images-subdir-cache nil)

(defvar org-notes-dir "~/org/org-notes/")
(defvar org-book-notes (concat org-notes-dir "Books/"))
(defvar org-misc-notes (concat org-notes-dir "Misc/"))
(defvar org-workitem-notes (concat org-notes-dir "WorkItems/"))
(defvar org-meeting-notes (concat org-notes-dir "Meetings/"))
(defvar org-presentation-notes (concat org-notes-dir "Presentations/"))
(defvar org-journal-notes (concat org-notes-dir "Journal.org"))

(provide 'bjl-global-variables)
