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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(dumb-jump keychain-environment ggtags function-args exec-path-from-shell whitespace-cleanup-mode projectile zenburn-theme markdown-mode color-theme-sanityinc-solarized rg rainbow-delimiters color-theme-sanityinc-tomorrow company auto-complete idle-highlight-mode paredit magit geiser cider smex better-defaults use-package))
 '(safe-local-variable-values
   '((nrepl-use-ssh-fallback-for-remote-hosts . t)
     (cider-ns-refresh-after-fn . "user/start")
     (cider-ns-refresh-before-fn . "user/stop")
     (cider-clojure-cli-global-options . "-A:dev:test:package")
     (eval progn
	   (put-clojure-indent 'async 1)
	   (put-clojure-indent 'car/wcar 1)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
