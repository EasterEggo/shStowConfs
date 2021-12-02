(add-to-list 'load-path "~/.emacs.d/cfg")

(add-hook 'prog-mode-hook 'display-line-numbers-mode)

(setq make-backup-files nil)

(require 'straight)
(require 'func)

(require 'style)
(require 'utils)
(require 'dashboard)
(require 'bindings)
(require 'prog)
(require 'auto-insert)
(require 'prod)
