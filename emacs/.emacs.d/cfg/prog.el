(defconst lsp-hooks
  '(html-mode-hook
    css-mode-hook
    js-mode-hook

    c-mode-hook
    shell-mode-hook

    sql-mode-hook))

(use-package quickrun)

(use-package lsp-mode
  :ghook (lsp-hooks #'lsp))

(use-package vterm)

(use-package magit
  :config (use-package forge)
  :general
  (:states 'normal
	   :prefix "<SPC>m"
	   "m" 'magit
	   "c" 'magit-commit
	   "s" 'magit-stage
	   "u" 'magit-unstage
	   "p" 'magit-push
	   "r" 'magit-reset
	   ))

(use-package docker)

(use-package adaptive-wrap :init (adaptive-wrap-prefix-mode))

(provide 'prog)
