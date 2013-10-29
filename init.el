;; init.el --- Where all the magic begins
;;
;; This is the first thing to get loaded.

;; load the starter kit from the `after-init-hook' so all packages are loaded
(add-hook 'after-init-hook
 `(lambda ()
    ;; remember this directory
    (setq dotemacs-dir
          ,(file-name-directory (or load-file-name (buffer-file-name))))
    ;; load up emacs.org
    (require 'org)
    (org-babel-load-file (expand-file-name "emacs.org" dotemacs-dir))))

;;; init.el ends here
