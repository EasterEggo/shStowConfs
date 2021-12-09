(use-package org-roam
  :init
  (setq org-roam-v2-ack t)
  :config
  (setq org-roam-directory (file-truename "~/org/roam")
	org-roam-db-autosync-mode t))
(require 'org-roam-protocol)
(setq org-roam-protocol-store-links "~/org/roam")

(use-package org-bullets
  :hook (org-mode . org-bullets-mode))
(use-package org
  :hook
  ((org-mode . org-indent-mode)))


(provide 'prod)
