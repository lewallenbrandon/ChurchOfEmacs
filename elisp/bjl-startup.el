;; Setup

;; Performance Startup Tracking
(setq gc-cons-threshold (* 50 1000 1000))
(defun bjl/display-startup-time ()
  (message "Emacs loaded in %s with %d garbage collections."
           (format "%.2f seconds"
                   (float-time
                    (time-subtract after-init-time before-init-time)))
           gcs-done))

(add-hook 'emacs-startup-hook #'bjl/display-startup-time)




(provide 'bjl-startup) 
