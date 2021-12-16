(use-package general)

(use-package evil
  :init
  (evil-mode))

(use-package evil-nerd-commenter
  :requires
  (evil)
  :general
  (:states 'normal "<SPC>;" 'evilnc-comment-or-uncomment-lines))

(use-package which-key :init (which-key-mode))

(provide 'bindings)
