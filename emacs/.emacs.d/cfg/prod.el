(pkg 'org-roam)
(setq org-roam-directory (file-truename "~/org/roam"))
(setq org-roam-db-autosync-mode t)
(setq org-roam-v2-ack t)

(require 'org-roam-protocol)

(pkg 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(provide 'prod)
