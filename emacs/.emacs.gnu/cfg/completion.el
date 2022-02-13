(use-package vertico
 :straight
 consult
 marginalia
 savehist orderless
 all-the-icons-completion
 embark
 embark-consult
 t

 :init
 (vertico-mode)
 (savehist-mode)
 (marginalia-mode)
 (all-the-icons-completion-mode)

 :custom
 (completion-styles '(orderless))
 (completion-category-defaults nil)
 (completion-category-overrides '((file (styles partial-completion))))
 :general (:states 'normal
                   :prefix "<SPC>"
                           "<SPC>" 'execute-extended-command
                           "." 'find-file

                           "<" 'consult-buffer
                           "b" 'consult-bookmark
                           "r" 'consult-recent-file)

(:states 'normal "/" 'consult-line)

("C-." 'embark-act)
(:keymaps 'vertico-map
 "<DEL>" 'vertico-directory-delete-char))

(add-to-list 'load-path (expand-file-name "straight/repos/vertico/extensions" user-emacs-directory))
(require 'vertico-directory)

(use-package company
:straight company-box t

:custom
(global-company-mode 1)
(company-minimum-prefix-length 1)
(company-selection-wrap-around t)

:ghook
('company-mode-hook #'company-box-mode))

(provide 'completion)
