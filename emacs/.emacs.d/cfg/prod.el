(use-package org-roam
  :init (setq org-roam-v2-ack t)
  :config
  (setq org-roam-directory (file-truename "~/org/roam")
	org-roam-db-autosync-mode t)
  (require 'org-roam-protocol)
  (setq org-roam-protocol-store-links "~/org/roam")
  :general
  (:states 'normal "<SPC>ni" 'org-roam-node-insert))

(use-package org-bullets :ghook 'org-mode-hook)

(use-package org
  :gfhook ('org-mode-hook
	   (list #'org-indent-mode)))

(use-package pass :config (use-package password-store))

(use-package perspective
  :init (persp-mode)
  :general (:states 'normal
		    :prefix "<SPC>p"

		    "s" 'persp-switch
		    "d" 'persp-kill
		    "r" 'persp-rename))


(use-package projectile :init (projectile-mode))

(setq org-agenda-files '("~/org/roam/20211129102234-agenda.org"))

(provide 'prod)
