(use-package all-the-icons)
(use-package dashboard
  :init
  (dashboard-setup-startup-hook)
  (initial-buffer-choice (lambda () (get-buffer "*dashboard*")))
  :custom
  (dashboard-center-content t)
  (dashboard-set-heading-icons t)
  (dashboard-set-file-icons t)
  (dashboard-set-navigator t))

(provide 'dashboard)
