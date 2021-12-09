(setq default-frame-alist '(
			    (vertical-scroll-bars . nil)
			    (font . "JetBrains Mono Nerd Font-11")))

(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

(use-package doom-themes
  :config (load-theme 'doom-dracula t))

(use-package doom-modeline
  :config (doom-modeline-mode 1))

(use-package rainbow-delimiters
  :init (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(set-frame-parameter (selected-frame) 'alpha '(95 . 50))
(add-to-list 'default-frame-alist '(alpha . (95 . 50)))

(provide 'style)
