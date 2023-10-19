(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(menu-bar-mode -1)
(pixel-scroll-precision-mode 1)
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(setq visible-bell 1)
(recentf-mode)
(setq inhibit-startup-screen t)
(set-face-attribute 'default nil :font "CommitMono" :height 110)
(defalias 'yes-or-no-p 'y-or-n-p)
(setq make-backup-files nil)

(defvar elpaca-installer-version 0.5)
(defvar elpaca-directory (expand-file-name "elpaca/" user-emacs-directory))
(defvar elpaca-builds-directory (expand-file-name "builds/" elpaca-directory))
(defvar elpaca-repos-directory (expand-file-name "repos/" elpaca-directory))
(defvar elpaca-order '(elpaca :repo "https://github.com/progfolio/elpaca.git"
                              :ref nil
                              :files (:defaults (:exclude "extensions"))
                              :build (:not elpaca--activate-package)))
(let* ((repo  (expand-file-name "elpaca/" elpaca-repos-directory))
       (build (expand-file-name "elpaca/" elpaca-builds-directory))
       (order (cdr elpaca-order))
       (default-directory repo))
  (add-to-list 'load-path (if (file-exists-p build) build repo))
  (unless (file-exists-p repo)
    (make-directory repo t)
    (when (< emacs-major-version 28) (require 'subr-x))
    (condition-case-unless-debug err
        (if-let ((buffer (pop-to-buffer-same-window "*elpaca-bootstrap*"))
                 ((zerop (call-process "git" nil buffer t "clone"
                                       (plist-get order :repo) repo)))
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

(use-package general)
(elpaca-wait)

(use-package nerd-icons)
(use-package modus-themes
  :config
  (setq modus-themes-common-palette-overrides
	'((border-mode-line-active unspecified)
          (border-mode-line-inactive unspecified)
	  (bg-mode-line-active bg-lavender)
	  (bg-region bg-ochre)
          (fg-region unspecified)
	  (comment yellow-cooler)
          (string green-cooler)))
  (load-theme 'modus-vivendi t))

(use-package evil :config (evil-mode 1))

(use-package nix-mode
  :mode "\\.nix\\'")

(use-package vertico
  :elpaca (:files (:defaults "extensions/*"))
  :config
  (vertico-mode))
(use-package vertico-directory
  :after vertico
  :elpaca nil
  :bind (:map vertico-map
	      ("RET" . vertico-directory-enter)
	      ("DEL" . vertico-directory-delete-char)))
(use-package embark-consult)
(use-package embark)
(use-package consult
  :general
  (:states 'normal
	   :prefix "<SPC>o"
	   "m" 'consult-man
	   "b" 'consult-buffer
	   "r" 'consult-recent-file
	   "g" 'consult-ripgrep))
(use-package marginalia
  :after vertico
  :config (marginalia-mode))
(use-package orderless
  :after vertico
  :config
  (setq completion-styles '(substring orderless basic))
  (setq completion-in-region-function 'consult-completion-in-region))
(use-package which-key
  :config (which-key-mode))
(use-package company
  :hook (elpaca-after-init . global-company-mode))
(use-package lsp-ui
  :after lsp-mode
  :config
  (setq lsp-ui-doc-show-with-cursor nil)
  (setq lsp-ui-doc-position 'at-point))
(use-package tree-sitter
  :config (global-tree-sitter-mode)
  :hook (prog-mode . tree-sitter-hl-mode))
(use-package magit)
(use-package diff-hl :hook (elpaca-after-init . global-diff-hl-mode))
(use-package doom-modeline
  :init (doom-modeline-mode 1))

(setq org-agenda-files '("~/notes/agenda.org"))
(use-package org-modern
  :hook (org-mode . org-modern-mode))

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

(use-package emms
  :config (emms-all))

(setq emms-player-list '(emms-player-vlc)
      emms-info-functions '(emms-info-native))
(use-package platformio-mode)
(add-hook 'c++-mode-hook (lambda ()
                           (lsp-deferred)
                           (platformio-conditionally-enable)))
(use-package vterm
  :general
  (:states 'normal
	   "<SPC>t" 'vterm-other-window))
(use-package elfeed
  :config
  (setq elfeed-feeds
	'(("https://hnrss.org/best" HN best)
	  ("https://hnrss.org/frontpage" HN frontpage)
	  ("https://www.youtube.com/feeds/videos.xml?channel_id=UC7YOGHUfC1Tb6E4pudI9STA" youtube mentalOutlaw)
	  ))
  (add-hook 'elfeed-new-entry-hook
            (elfeed-make-tagger :before "2 weeks ago"
				:remove 'unread)))
(use-package elfeed-goodies
  :config (elfeed-goodies/setup))
(use-package pdf-tools
  :config (pdf-loader-install))

(use-package org-drill)
