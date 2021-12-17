(use-package general)

(use-package evil
  :init
  (evil-mode)
  :general
  (:states 'normal
	   "/" 'swiper))

(use-package evil-nerd-commenter
  :requires
  (evil)
  :general
  (:states 'normal "<SPC>;" 'evilnc-comment-or-uncomment-lines))

(use-package which-key :init (which-key-mode))

;;some main bindings
(general-define-key
 "<escape>" 'keyboard-escape-quit)

(provide 'keys)
