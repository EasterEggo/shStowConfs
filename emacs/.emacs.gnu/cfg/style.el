(setq custom-theme-directory (expand-file-name "cfg" user-emacs-directory))

(setq default-frame-alist '((vertical-scroll-bars . nil)
			    (font . "JetBrainsMono Nerd Font-12")))
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

(use-package page-break-lines :custom (global-page-break-lines-mode t))

(use-package doom-themes :config (load-theme 'doom-dracula t))
(use-package doom-modeline :init (doom-modeline-mode))

(use-package rainbow-delimiters :ghook 'prog-mode-hook)
(use-package rainbow-mode :ghook 'prog-mode-hook)

(provide 'style)
