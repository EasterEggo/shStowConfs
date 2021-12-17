(add-to-list 'load-path  ".config/emacs/cfg/")

(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(setq make-backup-files nil)

(require 'straight)
(require 'custom)

(require 'keys)
(require 'style)
(require 'completion)
(require 'auto-insert)
(require 'prog)
(require 'prod)
(require 'dashboard)
