(use-package org-roam
  :init
  (setq org-roam-v2-ack t)
  :config
  (require 'org-protocol)
  (setq org-roam-directory (file-truename "~/org/roam")
        org-roam-db-autosync-mode t
        org-roam-protocol-store-links "~/org/roam")
  :general
  (:states 'normal
           "<SPC>ni" 'org-roam-node-insert))


(use-package org-bullets :ghook 'org-mode-hook)

(use-package org
  :gfhook
  ('org-mode-hook (list #'org-indent-mode))
  :custom
  (org-agenda-files '("~/org/roam/20211223160517-agenda.org")))

(use-package pass
  :straight password-store t
  :general
  (:states 'normal
           :prefix "<SPC>p"
           "p" 'pass
           "i" 'password-store-insert
           "r" 'password-store-rename
           "d" 'password-store-remove
           "g" 'password-store-generate))

(use-package perspective
  :init
  (persp-mode)
  :general
  (:states 'normal
           :prefix "<SPC>w"
           "s" 'persp-switch
           "d" 'persp-kill
           "r" 'persp-rename))

(use-package projectile
  :straight ag rg t
  :custom
  (projectile-mode 1))


(provide 'prod)
