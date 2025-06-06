(defvar elpaca-installer-version 0.10)
(defvar elpaca-directory (expand-file-name "elpaca/" user-emacs-directory))
(defvar elpaca-builds-directory (expand-file-name "builds/" elpaca-directory))
(defvar elpaca-repos-directory (expand-file-name "repos/" elpaca-directory))
(defvar elpaca-order '(elpaca :repo "https://github.com/progfolio/elpaca.git"
                              :ref nil :depth 1 :inherit ignore
                              :files (:defaults "elpaca-test.el" (:exclude "extensions"))
                              :build (:not elpaca--activate-package)))
(let* ((repo  (expand-file-name "elpaca/" elpaca-repos-directory))
       (build (expand-file-name "elpaca/" elpaca-builds-directory))
       (order (cdr elpaca-order))
       (default-directory repo))
  (add-to-list 'load-path (if (file-exists-p build) build repo))
  (unless (file-exists-p repo)
    (make-directory repo t)
    (when (<= emacs-major-version 28) (require 'subr-x))
    (condition-case-unless-debug err
        (if-let* ((buffer (pop-to-buffer-same-window "*elpaca-bootstrap*"))
                  ((zerop (apply #'call-process `("git" nil ,buffer t "clone"
                                                  ,@(when-let* ((depth (plist-get order :depth)))
                                                      (list (format "--depth=%d" depth) "--no-single-branch"))
                                                  ,(plist-get order :repo) ,repo))))
                  ((zerop (call-process "git" nil buffer t "checkout"
                                        (or (plist-get order :ref) "--"))))
                  (emacs (concat invocation-directory invocation-name))
                  ((zerop (call-process emacs nil buffer nil "-Q" "-L" "." "--batch"
                                        "--eval" "(byte-recompile-directory \".\" 0 'force)")))
                  ((require 'elpaca))
                 ((elpaca-generate-autoloads "elpaca" repo)))
            (progn (message "%s" (buffer-string)) (kill-buffer buffer))
          (error "%s" (with-current-buffer buffer (buffer-string))))
      ((error) (warn "%s" err) (delete-directory repo 'recursive))))
  (unless (require 'elpaca-autoloads nil t)
    (require 'elpaca)
    (elpaca-generate-autoloads "elpaca" repo)
    (load "./elpaca-autoloads")))
(add-hook 'after-init-hook #'elpaca-process-queues)
(elpaca `(,@elpaca-order))

(elpaca elpaca-use-package
  (elpaca-use-package-mode)
  (setq elpaca-use-package-by-default t))
(elpaca-wait)
(setq gc-cons-threshold 3500000)

(use-package general)

(elpaca-wait)

(use-package evil :config (evil-mode 1))
(which-key-mode)

(add-to-list 'default-frame-alist
             '(font . "Hack Nerd Font-12"))
(setq inhibit-startup-screen t)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(menu-bar-mode -1)
(setq visible-bell 1)
(add-hook 'prog-mode-hook (lambda () (setq display-line-numbers 'relative)))

(use-package nerd-icons)
(use-package dashboard
    :config
    (dashboard-setup-startup-hook)
    (setq initial-buffer-choice (lambda () (get-buffer "*dashboard*"))))

;;(use-package modus-themes
;;  :config
;;  (setq modus-themes-common-palette-overrides
;;	'((border-mode-line-active unspecified)
;;          (border-mode-line-inactive unspecified)
;;	  (bg-mode-line-active bg-lavender)
;;	  (bg-region bg-ochre)
;;          (fg-region unspecified)
;;	  (comment yellow-cooler)
;;          (string green-cooler)))
;;  (load-theme 'modus-vivendi t))
(use-package dracula-theme
    :config(load-theme 'dracula t))

(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :config
  (setq doom-modeline-height 25))

(savehist-mode 1)
(use-package vertico
  :ensure (:files (:defaults "extensions/*"))
  :config
  (vertico-mode))

(use-package vertico-directory
  :after vertico
  :ensure nil
  :general (:states 'normal
		    :prefix "<SPC>"
		    "SPC" 'execute-extended-command)
  :bind (:map vertico-map
	      ("RET" . vertico-directory-enter)
	      ("DEL" . vertico-directory-delete-char)))

(use-package embark)

(use-package embark-consult)

(use-package orderless
  :after vertico
  :config
  (setq completion-styles '(substring orderless basic))
  (setq completion-in-region-function 'consult-completion-in-region))

(use-package consult
  :general
  (:states 'normal
	   :prefix "<SPC>o"
	   "u" 'consult-bookmark
	   "m" 'consult-man
           "n" 'consult-notes
	   "b" 'consult-buffer
	   "r" 'consult-recent-file
	   "g" 'consult-ripgrep))

(use-package marginalia
  :after vertico
  :config (marginalia-mode))

;;(use-package company
;;  :hook (elpaca-after-init . global-company-mode))
(use-package tempel
  :bind (("M-+" . tempel-complete) ;; Alternative tempel-expand
         ("M-*" . tempel-insert))
  :init
  ;; Setup completion at point
  (defun tempel-setup-capf ()
    (setq-local completion-at-point-functions
                (cons #'tempel-expand
                      completion-at-point-functions)))

  (add-hook 'conf-mode-hook 'tempel-setup-capf)
  (add-hook 'prog-mode-hook 'tempel-setup-capf)
  (add-hook 'text-mode-hook 'tempel-setup-capf)

  ;; Optionally make the Tempel templates available to Abbrev,
  ;; either locally or globally. `expand-abbrev' is bound to C-x '.
  ;; (add-hook 'prog-mode-hook #'tempel-abbrev-mode)
  ;; (global-tempel-abbrev-mode)
)
(use-package corfu
  :init (global-corfu-mode 1)
  :config (setq corfu-auto t
      corfu-quit-no-match 'separator
      global-corfu-minibuffer nil))
(use-package projectile
  :config
  (projectile-mode 1)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))
(use-package undo-tree
  :config (global-undo-tree-mode))
(recentf-mode)
(electric-pair-mode)

;;(use-package ob-rust)
;;(use-package rust-mode)
;;(use-package rustic)

;;(use-package jsonrpc)
;;(use-package eglot)

(use-package magit)

(use-package diff-hl :hook (elpaca-after-init . global-diff-hl-mode))

(use-package transient)

(use-package tree-sitter
  :config
  (global-tree-sitter-mode)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))
(use-package tree-sitter-langs)
(use-package rainbow-delimiters
  :config (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(use-package vterm
  :general
  (:states 'normal
	   "<SPC>t" 'vterm-other-window))

(use-package mpv)

(use-package emms
  :config
  (emms-all)
  (setq emms-source-file-default-directory "~/Music"))
(setq emms-player-list '(emms-player-mpv)
      emms-info-functions '(emms-info-native
			    emms-info-metaflac))

(use-package elfeed
  :config
  (add-hook 'elfeed-new-entry-hook
            (elfeed-make-tagger :before "2 weeks ago"
				:remove 'unread))
  :bind(:map elfeed-search-mode-map
	     ("U" . elfeed-update)))

(use-package elfeed-goodies
  :config (elfeed-goodies/setup))

(use-package elfeed-tube
  :after elfeed
  :config
  (elfeed-tube-setup)

  :bind (:map elfeed-show-mode-map
         ("F" . elfeed-tube-fetch)
         ([remap save-buffer] . elfeed-tube-save)
         :map elfeed-search-mode-map
         ("F" . elfeed-tube-fetch)
         ([remap save-buffer] . elfeed-tube-save)))

(use-package elfeed-tube-mpv
  :after elfeed
  :bind (:map elfeed-show-mode-map
              ("U" . elfeed-tube-mpv)
              ("C-c C-f" . elfeed-tube-mpv-follow-mode)
              ("C-c C-w" . elfeed-tube-mpv-where)))

(use-package elfeed-org
  :config
  (elfeed-org)
  (setq rmh-elfeed-org-files (list "~/notes/feed.org")))

(use-package hackernews)

(use-package denote
  :config
  (setq denote-directory(expand-file-name "~/notes/")
	denote-file-type nil))
(setq org-hide-emphasis-markers t)
(setq org-src-preserve-indentation t)
(org-babel-do-load-languages
 'org-babel-load-languages
 '((C . t)
   (python . t)))
(use-package consult-notes
    :after consult
    :config
    (consult-notes-denote-mode))

(setq org-agenda-files '("~/notes/agenda.org"))
(use-package org-download
  :config ((add-hook 'dired-mode-hook 'org-download-enable))
  :general (:states 'normal
		    :prefix "<SPC>p"
		    "p" 'org-download-clipboard))
(use-package org-modern
  :hook (org-mode . org-modern-mode))

(custom-set-variables
 '(org-format-latex-options
   '(:foreground default :background default :scale 1.5 :html-foreground "Black" :html-background "Transparent" :html-scale 1.0 :matchers
		 ("begin" "$1" "$" "$$" "\\(" "\\["))))

(use-package pdf-tools
  :config (pdf-loader-install))
(use-package nov
  :init
  (add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode)))

;;(use-package ellama
;;  :init
;;  (setopt ellama-keymap-prefix "C-c e")
;;  (setopt ellama-language "Portuguese"))
