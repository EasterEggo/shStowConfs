(defconst lsp-hooks
  '(html-mode-hook
    css-mode-hook
    js-mode-hook

    c-mode-hook
    shell-mode-hook

    sql-mode-hook))

(use-package quickrun)

(use-package lsp-mode :ghook (lsp-hooks #'lsp))

(use-package vterm
 :general
 (:states 'normal
          :keymaps 'vterm-mode-map
          "p" 'vterm-yank))

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

(use-package adaptive-wrap :init (adaptive-wrap-prefix-mode))

(provide 'prog)
