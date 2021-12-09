(add-to-list 'load-path "~/.emacs.d/cfg/languages")

(use-package company
  :init (add-hook 'after-init-hook 'global-company-mode)
  :config (setq company-idle-delay 0
		company-minimum-prefix-length 1
		company-selection-wrap-around t))

(if (fboundp 'company)
    (use-package company-box
      :hook (company-mode . company-box-mode)))

(use-package quickrun)

(use-package lsp-mode)

(require 'rs)
(require 'py)
(require 'cc)
(require 'sh)

(provide 'prog)
