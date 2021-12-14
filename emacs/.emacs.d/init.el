(add-to-list 'load-path "~/.emacs.d/cfg")

(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(setq make-backup-files nil)

(require 'straight)
(require 'func)

(require 'bindings)
(require 'style)
(require 'completion)
(require 'auto-insert)
(require 'prog)
(require 'prod)
(require 'dashboard)
