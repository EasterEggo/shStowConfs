(use-package general)

(use-package evil
  :straight evil-nerd-commenter t
  :init
  (evil-mode)
  :general
  (:states 'normal
	   "/" 'consult-line
	   "<SPC>;" 'evilnc-comment-or-uncomment-lines))

(use-package which-key :init (which-key-mode))

;;some main bindings
(general-define-key
 "<escape>" 'keyboard-escape-quit)

(provide 'keys)
