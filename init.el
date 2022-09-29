(setq user-full-name "Samrat Man Singh")

(setq gc-cons-threshold 50000000)
(setq large-file-warning-threshold 100000000)

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(global-hl-line-mode +1)
(blink-cursor-mode -1)
(line-number-mode +1)
(global-display-line-numbers-mode 1)
(column-number-mode t)
(size-indication-mode t)
(fset 'yes-or-no-p 'y-or-n-p)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq inhibit-startup-screen t)
(set-frame-font "Inconsolata 20" nil t)



;; meaningful names for buffers with the same name
;; from prelude
;; https://github.com/bbatsov/prelude
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)
(setq uniquify-separator "/")
(setq uniquify-after-kill-buffer-p t)    ; rename after killing uniquified
(setq uniquify-ignore-buffers-re "^\\*") ; don't muck with special buffers


(use-package magit
  :ensure t
  :bind ("C-x g" . 'magit-status)
  :config
  (setq magit-set-upstream-on-push 'askifnotset))


(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-one t)
  (doom-themes-visual-bell-config))


(setq frame-title-format
      '((:eval (if (buffer-file-name)
       (abbreviate-file-name (buffer-file-name))
       "%b"))))
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))


(global-auto-revert-mode t)
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq-default tab-width 4
          indent-tabs-mode nil)
(add-hook 'before-save-hook 'whitespace-cleanup)
   (setq create-lockfiles nil)

(use-package projectile
  :ensure t
  :diminish projectile-mode
  :bind
  (("C-c p f" . projectile-find-file)
   ("C-c p p" . projectile-switch-project)
   ("C-c p s" . projectile-save-project-buffers))
  :config
  (projectile-mode +1)
  )

(use-package flycheck
  :ensure t
  :diminish flycheck-mode
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode))


(use-package exec-path-from-shell
  :ensure t
  :config
  (exec-path-from-shell-initialize))


(use-package paredit
  :ensure t
  :init
  (add-hook 'clojure-mode-hook 'enable-paredit-mode)
  (add-hook 'cider-repl-mode-hook 'enable-paredit-mode)
  (add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode))


(use-package cider
  :ensure t
  :hook ((cider-mode . eldoc-mode)
     (cider-repl-mode . paredit-mode)
     (cider-repl-mode . (lambda ()
                  (local-set-key (kbd "C-c C-l") 'cider-repl-clear-buffer)))))


(use-package ido-vertical-mode
  :ensure t
  :config
  (ido-vertical-mode 1)
  (setq ido-use-faces t
        ido-vertical-show-count t))

(use-package ivy
  :ensure t
  :bind ("C-x b". 'ivy-switch-buffer)
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-height 10)
  (setq ivy-count-format "")
  (setq ivy-count-format "(%d/%d) ")

  ;; Use [Enter] to navigate into the directory, not dired-open it.
  (define-key ivy-minibuffer-map (kbd "C-m") 'ivy-alt-done))


(use-package rg
  :ensure t)

(use-package dumb-jump
  :ensure t
  :config
  (add-hook 'xref-backend-functions #'dumb-jump-xref-activate)
  (define-key dumb-jump-mode-map (kbd "C-M-q") nil)
  (define-key dumb-jump-mode-map (kbd "C-M-p") nil)
  (define-key dumb-jump-mode-map (kbd "C-c d g") 'dumb-jump-go)
  (define-key dumb-jump-mode-map (kbd "C-c d b") 'dumb-jump-back)
  (setq dumb-jump-selector 'ivy
        dumb-jump-prefer-searcher 'rg))


(use-package counsel
  :ensure t
  :config
  (setcdr (assoc 'counsel-M-x ivy-initial-inputs-alist) "")
  :bind (("M-x" . counsel-M-x)))


(use-package zig-mode
  :ensure t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(zig-mode dumb-jump rg smex uniquify paredit vlf terraform-mode yaml-mode typescript-mode flycheck-golangci-lint marginalia browse-kill-ring selectrum-prescient selectrum omnisharp csharp-mode ag exec-path-from-shell go-mode ivy-rich counsel ivy yasnippet which-key use-package smartparens projectile magit lsp-ui flycheck expand-region doom-themes diminish crux company-lsp avy))
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
(put 'set-goal-column 'disabled nil)
