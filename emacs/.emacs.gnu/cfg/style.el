(setq default-frame-alist '((vertical-scroll-bars . nil)
                            (font . "JetBrains Mono Nerd Font-11")))

(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

(use-package doom-themes :init (load-theme 'doom-monokai-octagon t))

(use-package doom-modeline :init (doom-modeline-mode))

(use-package anzu :init (global-anzu-mode))

(use-package evil-anzu :requires (anzu))

(use-package rainbow-delimiters :ghook 'prog-mode-hook)

(use-package rainbow-mode :ghook 'prog-mode-hook)

(use-package sublimity)
(require 'sublimity-scroll)

(use-package format-all
  :gfhook ('prog-mode-hook (list #'format-all-mode #'format-all-ensure-formatter))
  :custom (format-all-formatters t))

;;(set-frame-parameter (selected-frame) 'alpha '(95 . 50))
;;(add-to-list 'default-frame-alist '(alpha . (95 . 50)))

(provide 'style)
