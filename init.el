;; Configuration is separated into files with (as best as possible) logical groupings

;; Directory with customization files. 
(defvar dotemacs-elisp-dir "~/.emacs.d/elisp/")
(add-to-list 'load-path dotemacs-elisp-dir) 


(require 'bjl-startup) ;; Make LOADING the Editor Performant
(require 'bjl-package-management) ;; Package Management 
(require 'bjl-global-variables) ;; I'd like to have these available everywhere
(require 'bjl-custom-functions) ;; These are custom functions that don't have strong dependencies on subsequent items
(require 'bjl-defaults) ;; These are changes to Emacs Behavior. 
(require 'bjl-keybinds) ;; Custom keybindings and evil (vim) setup.
(require 'bjl-org) ;; Org deserved its own section 
(require 'bjl-utilities) ;; These packages are mostly concerned with help and navigation 
(require 'bjl-theme) ;; Self-explanatory
(require 'bjl-programming) ;; Autocompletion, LSP, DAP, and Magit 
(require 'bjl-terminal) ;; eShell and Terminal configuration
(require 'bjl-finalize) ;; Make USING the Editor Performant
