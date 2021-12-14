(use-package general)

(use-package evil
  :init (evil-mode)
  :config (use-package evil-nerd-commenter
	    :general
	    (:states 'normal "<SPC>;" 'evilnc-comment-or-uncomment-lines)))

(use-package which-key :init (which-key-mode))

(provide 'bindings)
