(use-package all-the-icons)
(use-package dashboard
  :init
  (dashboard-setup-startup-hook)
  :custom
  (dashboard-center-content t)
  (dashboard-set-heading-icons t)
  (dashboard-set-file-icons t)
  (dashboard-set-navigator t)
  (initial-buffer-choice (lambda () (get-buffer "*dashboard*"))))

(provide 'dashboard)
