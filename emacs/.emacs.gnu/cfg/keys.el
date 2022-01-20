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

(use-package hydra)

(defhydra hydra-buffer-menu (:color purple
                             :hint nil)
"
^Change Buffer Size^            
^^^^^^^^------
_-_: shrink buffer horizontally
_+_: enlarge buffer horizontally   
_i_: enlarge buffer
_d_: shrink buffer

"
("+" enlarge-window-horizontally)
("-" shrink-window-horizontally)
("i" enlarge-window)
("d" shrink-window)
("c" nil "cancel")
("q" quit-window "quit" :color blue))

(defhydra hydra-zoom (:color green
                      :hint nil)
"
 ^zoom
 ^----
 _i_: increase text size
 _d_: decrease text size
"
("i" text-scale-increase)
("d" text-scale-decrease ))

;;some main bindings
(general-define-key
 "<escape>" 'keyboard-escape-quit)

(provide 'keys)
