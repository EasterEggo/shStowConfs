(use-package all-the-icons)
(use-package dashboard)

(dashboard-setup-startup-hook)
(setq initial-buffer-choice (lambda () (get-buffer "*dashboard*"))
 dashboard-center-content t
 dashboard-set-heading-icons t
 dashboard-set-file-icons t
 dashboard-set-navigator t
 dashboard-navigator-buttons
      `(;; line1
        ((,(all-the-icons-octicon "mark-github" :height 1.1 :v-adjust 0.0)
         "Official Repo"
	 "Github Repo"
         (lambda (&rest _) (browse-url "https://github.com/EasterEggo/shStowConfs"))))))

(add-hook 'dashboard-mode 'scroll-lock-mode)

(provide 'dashboard)
