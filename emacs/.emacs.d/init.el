(add-to-list 'load-path "~/.emacs.d/cfg")

(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(setq make-backup-files nil)

(require 'straight)
(require 'func)

(require 'style)
(require 'bindings)
(require 'dashboard)
(require 'utils)
(require 'auto-insert)
(require 'prog)
(require 'prod)
