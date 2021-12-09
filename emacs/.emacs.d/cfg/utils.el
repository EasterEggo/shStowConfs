(use-package vertico
  :config
  (vertico-mode 1))

(use-package orderless
  :init
  (setq completion-styles '(orderless)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))))

(use-package savehist
  :init
  (savehist-mode))

(use-package marginalia
  :config
  (marginalia-mode 1))

(use-package vterm)

(provide 'utils)
