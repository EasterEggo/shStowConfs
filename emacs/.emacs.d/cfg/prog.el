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

(use-package magit :config (use-package forge))

(use-package docker)

(use-package adaptive-wrap :init (adaptive-wrap-prefix-mode))

(provide 'prog)
