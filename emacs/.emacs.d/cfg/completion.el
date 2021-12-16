(use-package vertico
  :init
  (vertico-mode)
  :general
  (:states 'normal
	   :prefix "<SPC>"
	   "<SPC>" 'execute-extended-command
	   "." 'find-file))

(use-package consult
  :general
  (:states 'normal
	   :prefix "<SPC>"
	   "<" 'consult-buffer
	   "b" 'consult-bookmark
	   "r" 'consult-recent-file))

(use-package orderless
  :custom
  (completion-styles '(orderless))
  (completion-category-defaults nil)
  (completion-category-overrides '((file (styles partial-completion)))))

(use-package savehist :init (savehist-mode))

(use-package marginalia :init (marginalia-mode))

;; (use-package mini-frame
;; :init
;; (mini-frame-mode 1)
;; :config
;; (custom-set-variables
;; '(mini-frame-show-parameters
;; '((top . 0.4)
;; (width . 0.7)
;; (left . 0.5))))
;; (setq mini-frame-ignore-commands '(evil-ex)))

(use-package company
  :straight company-box
  :custom
  (global-company-mode 1)
  (company-idle-delay 0)
  (company-minimum-prefix-length 1)
  (company-selection-wrap-around t)
  :ghook
  ('company-mode-hook #'company-box-mode))

(provide 'completion)
