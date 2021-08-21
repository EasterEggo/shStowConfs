(setq make-backup-files nil)
(setq backup-directory-alist '(("" . "~/.emacs.d/backups"))
      delete-old-versions t)

;;straight plugin manager setup
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


;;packages using straight.el
(straight-use-package 'use-package)
(straight-use-package 'el-patch)
(straight-use-package 'ivy)
(straight-use-package 'neotree)
(straight-use-package 'all-the-icons)
(straight-use-package 'solaire-mode)
(straight-use-package 'evil)
(straight-use-package 'chocolate-theme)
(straight-use-package 'vterm)
(straight-use-package 'company)
(straight-use-package 'projectile)
(straight-use-package 'rust-mode)
(straight-use-package 'magit)
(straight-use-package 'doom-modeline)
(straight-use-package 'which-key)
(straight-use-package 'toc-org)


;;theme
(load-theme 'chocolate t)


;;removing menubars
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)


;;welcome screen
(use-package dashboard
  :config
  (dashboard-setup-startup-hook)
  (setq
   initial-buffer-choice (lambda () (get-buffer "*dashboard*"))
   dashboard-set-heading-icons t
   dashboard-set-file-icons t
   dashboard-banner-logo-title "Welcome to Teamacs"
   dashboard-startup-banner 'official
   dashboard-center-content t))


;;tabs
(use-package centaur-tabs
  :config
  (centaur-tabs-mode t)
  (centaur-tabs-headline-match)
  (setq
   centaur-tabs-style "bar"
   centaur-tabs-height 32
   centaur-tabs-set-icons t
   centaur-tabs-set-bar 'left
   x-underline-at-descent-line t)
  :hook
  (vterm-mode . centaur-tabs-local-mode)
  (dashboard-mode . centaur-tabs-local-mode))


;;LSP
(use-package lsp-mode
  :hook
  (rust-mode . lsp))


;;activating plugins
(evil-mode 1)
(ivy-mode 1)
(solaire-global-mode +1)
(add-hook 'after-init-hook #'doom-modeline-mode)
(add-hook 'after-init-hook 'global-company-mode)


;;plugins config
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
(which-key-setup-side-window-bottom)
(which-key-setup-minibuffer)
(which-key-mode)


;;bindings
(global-set-key [f8] 'neotree-toggle)
(evil-set-leader 'normal (kbd "<SPC>"))
(define-key evil-normal-state-map (kbd "<leader>.") 'dired)
(define-key evil-normal-state-map (kbd "<leader>SPC") 'execute-extended-command)


;;org mode
(setq
 org-directory "~/organization"
 org-agenda-files "~/organization/agenda.org"
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
  (org-roam-directory (file-truename "~/organization/roam/"))
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

;;fonts
(set-face-attribute 'default nil :font "Fira Code Nerd Font-13" )
;; set font for emoji
(set-fontset-font
 t
 '(#x1f300 . #x1fad0)
 (cond
  ((member "Noto Color Emoji" (font-family-list)) "Noto Color Emoji")
  ((member "Noto Emoji" (font-family-list)) "Noto Emoji")
  ((member "Segoe UI Emoji" (font-family-list)) "Segoe UI Emoji")
  ((member "Symbola" (font-family-list)) "Symbola")
  ((member "Apple Color Emoji" (font-family-list)) "Apple Color Emoji")))

;;misc
(defalias 'yes-or-no-p 'y-or-n-p)
(org-roam-db-sync 1)
