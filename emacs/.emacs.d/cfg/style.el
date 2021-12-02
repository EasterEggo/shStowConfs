(font "Fira Code Nerd Font-13")

(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

(pkg 'chocolate-theme)
(load-theme 'chocolate t)

(pkg 'doom-modeline)
(add-hook 'after-init-hook #'doom-modeline-mode)

(pkg 'rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(set-frame-parameter (selected-frame) 'alpha '(95 . 50))
(add-to-list 'default-frame-alist '(alpha . (95 . 50)))

(provide 'style)
