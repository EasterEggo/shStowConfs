(setq make-backup-files nil)
(setq backup-directory-alist '(("" . "~/.emacs.d/backups"))
      delete-old-versions t)

(defvar bootstrap-version)
	(let ((bootstrap-file
		    (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
		   (bootstrap-version 5))
	       (unless (file-exists-p bootstrap-file)
		 (with-current-buffer
		     (url-retrieve-synchronously
		      "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
		      'silent 'inhibit-cookies)
		   (goto-char (point-max))
		   (eval-print-last-sexp)))
	       (load bootstrap-file nil 'nomessage))
(setq straight-use-package-by-default t)

(straight-use-package 'use-package)
(straight-use-package 'el-patch)
(straight-use-package 'helm)
(straight-use-package 'helm-lsp)
(straight-use-package 'neotree)
(straight-use-package 'all-the-icons)
(straight-use-package 'solaire-mode)
(straight-use-package 'evil)
(straight-use-package 'doom-themes)
(straight-use-package 'vterm)
(straight-use-package 'company)
(straight-use-package 'projectile)
(straight-use-package 'rust-mode)
(straight-use-package 'magit)
(straight-use-package 'doom-modeline)
(straight-use-package 'which-key)
(straight-use-package 'password-store)
(straight-use-package 'toc-org)
(straight-use-package 'company-box)
(straight-use-package 'restclient)
(straight-use-package 'org-bullets)

(load-theme 'doom-ayu-mirage t)

(use-package dashboard
  :config
  (dashboard-setup-startup-hook)
  (setq
   initial-buffer-choice (lambda () (get-buffer "*dashboard*"))
   dashboard-set-heading-icons t
   dashboard-set-file-icons t
   dashboard-startup-banner 'official
   dashboard-center-content t))

(use-package centaur-tabs
    :config
    (centaur-tabs-mode t)
   (centaur-tabs-headline-match)
    (setq
     centaur-tabs-style "wave"
    centaur-tabs-height 32
     centaur-tabs-set-icons t
     x-underline-at-descent-line t)
    :hook
    (vterm-mode . centaur-tabs-local-mode)
    (dashboard-mode . centaur-tabs-local-mode))

(use-package lsp-mode
  :hook
  (rust-mode . lsp)
  (c-mode . lsp))
(setq lsp-clangd-binary-path "/bin/clangd")

(setq
   org-agenda-files nil
   org-hide-leading-stars t
   org-odd-levels-only t
   org-pretty-entities t
   org-startup-indented t)

  (add-hook 'org-mode-hook 'toc-org-mode)

  (use-package org-roam
    :init
    (setq org-roam-v2-ack t)
    :custom
    (org-roam-directory (file-truename "~/organization/roam"))
    :bind (("C-c n l" . org-roam-buffer-toggle)
           ("C-c n f" . org-roam-node-find)
           ("C-c n g" . org-roam-graph)
           ("C-c n i" . org-roam-node-insert)
           ("C-c n c" . org-roam-capture)
           ("C-c n j" . org-roam-dailies-capture-today))
    :config
    (org-roam-db-autosync-mode))

  (use-package org-roam-ui
    :straight
      (:host github :repo "org-roam/org-roam-ui" :branch "main" :files ("*.el" "out"))
      :after org-roam
      :config
      (setq org-roam-ui-sync-theme t
            org-roam-ui-follow t
            org-roam-ui-update-on-save t
            org-roam-ui-open-on-start t))
(straight-use-package 'websocket)

(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

(setq inferior-lisp-program "sbcl")
(evil-mode 1)
(helm-mode 1)
; (solaire-global-mode +1)
(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'company-mode-hook 'company-box-mode)

(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
(which-key-setup-side-window-bottom)
(which-key-setup-minibuffer)
(which-key-mode)

(global-set-key [f8] 'neotree-toggle)
(evil-set-leader 'normal (kbd "<SPC>"))
(define-key evil-normal-state-map (kbd "<leader>.") 'helm-find-files)
(define-key evil-normal-state-map (kbd "<leader>SPC") 'helm-M-x)
(define-key evil-normal-state-map (kbd "<leader>,")'vterm-other-window)

(set-face-attribute 'default nil :font "Fira Code Nerd Font-13" )

(set-fontset-font
 t
 '(#x1f300 . #x1fad0)
 (cond
  ((member "Noto Color Emoji" (font-family-list)) "Noto Color Emoji")
  ((member "Noto Emoji" (font-family-list)) "Noto Emoji")
  ((member "Segoe UI Emoji" (font-family-list)) "Segoe UI Emoji")
  ((member "Symbola" (font-family-list)) "Symbola")
  ((member "Apple Color Emoji" (font-family-list)) "Apple Color Emoji")))

(defalias 'yes-or-no-p 'y-or-n-p)
(org-roam-db-sync 1)

(doom-modeline-mode 1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files '("~/organization/roam/20210911083035-agenda.org")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
