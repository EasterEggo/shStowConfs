(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(defalias 'yes-or-no-p 'y-or-n-p)
(setq make-backup-files nil)

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

(straight-use-package 'use-package)
(setq straight-use-package-by-default t)

(use-package general)
(use-package evil
  :straight evil-nerd-commenter t
  :init (evil-mode)
  :general
  (:states 'normal
           "/" 'consult-line
           "<SPC>;" 'evilnc-comment-or-uncomment-lines))

(use-package which-key :init (which-key-mode))

(use-package hydra)

;;some main bindings
(general-define-key
 "<escape>" 'keyboard-escape-quit)

(use-package all-the-icons)
(use-package dashboard
  :init
  (dashboard-setup-startup-hook)
  :custom
  (dashboard-center-content t)
  (dashboard-set-heading-icons t)
  (dashboard-set-file-icons t)
  (dashboard-set-navigator t)
  (initial-buffer-choice (lambda () (get-buffer "*dashboard*"))))

(use-package vertico
 :straight
 consult
 marginalia
 savehist orderless
 all-the-icons-completion
 embark
 embark-consult
 t

 :init
 (vertico-mode)
 (savehist-mode)
 (marginalia-mode)
 (all-the-icons-completion-mode)

 :custom
 (completion-styles '(orderless))
 (completion-category-defaults nil)
 (completion-category-overrides '((file (styles partial-completion))))
 :general (:states 'normal
                   :prefix "<SPC>"
                           "<SPC>" 'execute-extended-command
                           "." 'find-file

                           "<" 'consult-buffer
                           "b" 'consult-bookmark
                           "r" 'consult-recent-file)

(:states 'normal "/" 'consult-line)

("C-." 'embark-act)
(:keymaps 'vertico-map
 "<DEL>" 'vertico-directory-delete-char))

(add-to-list 'load-path (expand-file-name "straight/repos/vertico/extensions" user-emacs-directory))
(require 'vertico-directory)

(use-package undo-tree
:custom
(global-undo-tree-mode))

(use-package company
  :straight company-box t

:custom
(global-company-mode 1)
(company-minimum-prefix-length 1)
(company-selection-wrap-around t)

:hook (
       (company-mode . company-box-mode)))

(setq default-frame-alist '((vertical-scroll-bars . nil)
                            (font . "JetBrainsMono Nerd Font-12")))
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

(use-package page-break-lines
  :custom (global-page-break-lines-mode t))

(use-package doom-themes :config (load-theme 'doom-dracula t))
(use-package doom-modeline :init (doom-modeline-mode))

(use-package rainbow-delimiters :hook (prog-mode . rainbow-delimiters-mode))
(use-package rainbow-mode :hook prog-mode)

(use-package ein)

(use-package lsp-mode
 :hook (prog-mode . lsp)
 :straight lsp-haskell t)

(use-package dap-mode
:after lsp-mode
:config
(dap-mode t)
(dap-ui-mode t)
(dap-tooltip-mode t)
(tooltip-mode t)
(dap-ui-controls-mode t)
(require 'dap-gdb-lldb))

(use-package haskell-mode
 :mode "\\.hs\\'"
 :hook
 (('haskell-mode . lsp)
 ('haskell-literate-mode . lsp)))

(use-package vterm
 :general
 (:states 'normal
          :keymaps 'vterm-mode-map
          "p" 'vterm-yank)
 (:states 'normal
           "<SPC>," 'vterm-other-window))

(use-package magit
  :straight forge t
  :general
  (:states 'normal
           :prefix "<SPC>m"
           "m" 'magit
           "c" 'magit-commit
           "C" 'magit-clone
           "s" 'magit-stage
           "u" 'magit-unstage
           "p" 'magit-push
           "P" 'magit-pull
           "r" 'magit-reset
           ))

(use-package docker)

(use-package highlight-indent-guides
  :hook (prog-mode . highlight-indent-guides-mode)
  :custom (highlight-indent-guides-method 'bitmap))

(use-package hl-todo
  :config (global-hl-todo-mode))

(use-package git-gutter
  :config (global-git-gutter-mode))

(use-package adaptive-wrap :init (adaptive-wrap-prefix-mode))

(use-package org
:hook
  (org-mode . (lambda () (org-indent-mode) (variable-pitch-mode) (visual-line-mode)))
:custom
  (org-agenda-files '("~/org/master.org"))
  (org-hide-emphasis-markers t))


(use-package org-roam
  :after org
  :init
  (setq org-roam-v2-ack t)
  :custom
  (org-roam-directory (file-truename "~/org/roam"))
  (org-roam-complete-everywhere t)
  (org-roam-db-autosync-mode t)
  :general
  (:states 'normal
           "<SPC>ni" 'org-roam-node-insert))


(require 'org-roam-protocol)
(setq org-roam-protocol-store-links "~/org/roam")
(setq org-roam-capture-ref-templates
      '(("r" "ref" plain (function org-roam-capture--get-point)
         "%?"
         :file-name "${slug}"
         :head "#+TITLE: ${title} ,#+ROAM_KEY: ${ref}"
         :unnarrowed t)))

(use-package org-roam-ui
  :after org-roam
  :straight
  (:host github :repo "org-roam/org-roam-ui" :branch "main" :files ("*.el" "out"))
  :config
  (setq org-roam-ui-sync-theme t
        org-roam-ui-follow t
        org-roam-ui-update-on-save t
        org-roam-ui-open-on-start t))

(use-package org-bullets
  :hook (org-mode . org-bullets-mode))

(use-package toc-org
  :hook (org-mode . toc-org-mode))


(let* ((variable-tuple
      (cond ((x-list-fonts "Ubuntu Nerd Font")         '(:font "Ubuntu Nerd Font"))
            (nil (warn "Install Ubuntu Nerd Font."))))
     (base-font-color     (face-foreground 'default nil 'default))
     (headline           `(:inherit default :weight bold :foreground ,base-font-color)))

(custom-theme-set-faces
 'user
 `(org-level-8 ((t (,@headline ,@variable-tuple))))
 `(org-level-7 ((t (,@headline ,@variable-tuple))))
 `(org-level-6 ((t (,@headline ,@variable-tuple))))
 `(org-level-5 ((t (,@headline ,@variable-tuple))))
 `(org-level-4 ((t (,@headline ,@variable-tuple :height 1.1))))
 `(org-level-3 ((t (,@headline ,@variable-tuple :height 1.25))))
 `(org-level-2 ((t (,@headline ,@variable-tuple :height 1.5))))
 `(org-level-1 ((t (,@headline ,@variable-tuple :height 1.75))))
 `(org-document-title ((t (,@headline ,@variable-tuple :height 2.0 :underline nil))))

 '(fixed-pitch ((t (:family "JetBrainsMono Nerd Font" :height 120))))
 '(variable-pitch ((t (:family "Ubuntu Nerd Font" :height 130))))

 '(org-code ((t (:inherit fixed-pitch))))
 '(org-block ((t (:inherit fixed-pitch))))))

(use-package pass
  :straight password-store t
  :general
  (:states 'normal
           :prefix "<SPC>p"
           "p" 'pass
           "i" 'password-store-insert
           "r" 'password-store-rename
           "d" 'password-store-remove
           "g" 'password-store-generate))

;; (use-package persp-mode
  ;; :init
  ;; (persp-mode)
  ;; :general
  ;; (:states 'normal
           ;; :prefix "<SPC>w"
           ;; "s" 'persp-switch
           ;; "d" 'persp-kill
           ;; "r" 'persp-rename))

(use-package ag
  :straight rg t)

(use-package pdf-tools
  :custom
  (pdf-loader-install t)
  (pdf-tools-install t))

(use-package yasnippet
  :init
  (yas-global-mode)
  :custom
  (setq yas-snippet-dirs '("~/.emacs.d/snippets")))

(use-package elfeed
             :custom
             (elfeed-feeds
              '("https://distrowatch.com/news/dwd.xml" linux
                "https://www.economist.com/finance-and-economics/rss.xml" economics))
             (elfeed-search-filter "@1-week-ago +unread"))

;; (use-package exwm
;;   :config
;;   (exwm-enable))
;;   (add-hook 'exwm-update-class-hook
;;             (lambda ()
;;             (exwm-workspace-rename-buffer exwm-class-name))
;;   (setq exwm-input-global-keys
;;     `(([?\s-\C-r] . exwm-reset)
;;        ([?\s-w] . exwm-workspace-switch)
;;        ([?\s-i] . exwm-input-toggle-keyboard)
;;        ([?\s-E] . (lambda () (interactive) (find-file "~")))
;;        ([?\s-c] . (lambda () (interactive) (evil-quit)))
;;        ([?\s-\S-c] . (lambda () (interactive) (kill-buffer)))
;;        ([?\s-`] . (lambda () (interactive) (exwm-workspace-switch-create 0)))
;;        ,@(mapcar (lambda (i)
;;                    `(,(kbd (format "s-%d" i)) .
;;                       (lambda ()
;;                        (interactive)
;;                        (exwm-workspace-switch-create ,i))))
;;                   (number-sequence 0 9)))))

;; (add-to-list 'display-buffer-alist
;;              (cons "\\*Async Shell Command\\*.*" (cons #'display-buffer-no-window nil)))
