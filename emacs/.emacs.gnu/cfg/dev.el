(use-package quickrun)

(use-package lsp-mode :ghook ('prog-mode-hook #'lsp))
(use-package dap-mode
:config
(dap-mode t)
(dap-ui-mode t)
(dap-tooltip-mode t)
(tooltip-mode t)
(dap-ui-controls-mode t)
(require 'dap-gdb-lldb))


(use-package vterm
 :general
 (:states 'normal
          :keymaps 'vterm-mode-map
          "p" 'vterm-yank
          "<SPC>," 'vterm-other-window))

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

(provide 'dev)
