(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(menu-bar-mode -1)
(global-display-line-numbers-mode)
(recentf-mode)
(setq inhibit-startup-screen t)
(set-face-attribute 'default nil :font "Iosevka Nerd Font" :height 115)
(defalias 'yes-or-no-p 'y-or-n-p)
(setq make-backup-files nil)

(setq package-enable-at-startup nil)
(defvar elpaca-installer-version 0.4)
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
            (kill-buffer buffer)
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
(use-package meow
  :config
  (defun meow-setup ()
    (setq meow-cheatsheet-layout meow-cheatsheet-layout-dvorak)
    (meow-leader-define-key
     '("1" . meow-digit-argument)
     '("2" . meow-digit-argument)
     '("3" . meow-digit-argument)
     '("4" . meow-digit-argument)
     '("5" . meow-digit-argument)
     '("6" . meow-digit-argument)
     '("7" . meow-digit-argument)
     '("8" . meow-digit-argument)
     '("9" . meow-digit-argument)
     '("0" . meow-digit-argument)
     '("/" . meow-keypad-describe-key)
     '("?" . meow-cheatsheet))
    (meow-motion-overwrite-define-key
     ;; custom keybinding for motion state
     '("<escape>" . ignore))
    (meow-normal-define-key
     '("0" . meow-expand-0)
     '("9" . meow-expand-9)
     '("8" . meow-expand-8)
     '("7" . meow-expand-7)
     '("6" . meow-expand-6)
     '("5" . meow-expand-5)
     '("4" . meow-expand-4)
     '("3" . meow-expand-3)
     '("2" . meow-expand-2)
     '("1" . meow-expand-1)
     '("-" . negative-argument)
     '(";" . meow-reverse)
     '("," . meow-inner-of-thing)
     '("." . meow-bounds-of-thing)
     '("<" . meow-beginning-of-thing)
     '(">" . meow-end-of-thing)
     '("a" . meow-append)
     '("A" . meow-open-below)
     '("b" . meow-back-word)
     '("B" . meow-back-symbol)
     '("c" . meow-change)
     '("d" . meow-delete)
     '("D" . meow-backward-delete)
     '("e" . meow-line)
     '("E" . meow-goto-line)
     '("f" . meow-find)
     '("g" . meow-cancel-selection)
     '("G" . meow-grab)
     '("h" . meow-left)
     '("H" . meow-left-expand)
     '("i" . meow-insert)
     '("I" . meow-open-above)
     '("j" . meow-join)
     '("k" . meow-kill)
     '("l" . meow-till)
     '("m" . meow-mark-word)
     '("M" . meow-mark-symbol)
     '("t" . meow-next)
     '("T" . meow-next-expand)
     '("o" . meow-block)
     '("O" . meow-to-block)
     '("n" . meow-prev)
     '("N" . meow-prev-expand)
     '("q" . meow-quit)
     '("Q" . meow-goto-line)
     '("r" . meow-replace)
     '("R" . meow-swap-grab)
     '("p" . meow-search)
     '("s" . meow-right)
     '("S" . meow-right-expand)
     '("u" . meow-undo)
     '("U" . meow-undo-in-selection)
     '("v" . meow-visit)
     '("w" . meow-next-word)
     '("W" . meow-next-symbol)
     '("x" . meow-save)
     '("X" . meow-sync-grab)
     '("y" . meow-yank)
     '("z" . meow-pop-selection)
     '("'" . repeat)
     '("<escape>" . ignore)))
  (meow-setup)
  (meow-global-mode 1))

(use-package vertico
  :demand t
  :config
  (vertico-mode))
(use-package embark-consult)
(use-package embark)
(use-package consult
  :bind (("C-c o m" . consult-man)
	 ("C-c o b" . consult-buffer)
	 ("C-c o r" . consult-recent-file)
	 ("C-c o g" . consult-ripgrep)))
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
(use-package lsp-mode
  :hook (c-mode . lsp))
(use-package lsp-ui
  :after lsp-mode
  :config
  (setq lsp-ui-doc-show-with-cursor nil)
  (setq lsp-ui-doc-position 'at-point))
(use-package tree-sitter
  :config (global-tree-sitter-mode)
  :hook (prog-mode . tree-sitter-hl-mode))
(use-package tree-sitter-langs :after tree-sitter)
(use-package magit)
(use-package diff-hl :hook (elpaca-after-init . global-diff-hl-mode))
(use-package doom-modeline
  :init (doom-modeline-mode 1))
(use-package rainbow-delimiters :hook (prog-mode . rainbow-delimiters-mode))
(use-package org-modern
  :hook (org-mode . org-modern-mode))
(use-package org-roam
  :custom
  (org-roam-directory (file-truename "~/roam"))
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n g" . org-roam-graph)
         ("C-c n i" . org-roam-node-insert)
         ("C-c n c" . org-roam-capture)
         ;; Dailies
         ("C-c n j" . org-roam-dailies-capture-today))
  :config
  (setq org-roam-node-display-template (concat "${title:*} " (propertize "${tags:10}" 'face 'org-tag)))
  (org-roam-db-autosync-mode))
(use-package emms
  :config (emms-all))

(setq emms-player-list '(emms-player-vlc)
      emms-info-functions '(emms-info-native))
(use-package platformio-mode)
(add-hook 'c++-mode-hook (lambda ()
                           (lsp-deferred)
                           (platformio-conditionally-enable)))
(use-package vterm
  :bind (("C-c t" . vterm-other-window)))

