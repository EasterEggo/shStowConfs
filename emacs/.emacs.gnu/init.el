(add-to-list 'load-path  (expand-file-name "cfg/" user-emacs-directory))
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

(defalias 'yes-or-no-p 'y-or-n-p)

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
