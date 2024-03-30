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
(defvar org-personal-notes "~/org/Personal.org")

(defvar org-templates-dir "~/org_templates/")
(defvar org-templates-code-snippet (concat org-templates-dir "code_snippet.txt"))
(defvar org-templates-project-outline (concat org-templates-dir "project_outline.txt"))
 

(provide 'bjl-global-variables)
