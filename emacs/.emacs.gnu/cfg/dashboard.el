(use-package all-the-icons)
(use-package dashboard
  :init
  (dashboard-setup-startup-hook)
  :custom
  (dashboard-center-content t)
  (dashboard-set-heading-icons t)
  (dashboard-set-file-icons t)
  (dashboard-set-navigator t)
  (dashboard-navigator-buttons
    `(;; line1
      ((,(all-the-icons-octicon "mark-github" :height 1.1 :v-adjust 0.0)
       "Homepage"
       "Browse homepage"
       (lambda (&rest _) (browse-url "homepage")))
      ("★" "Star" "Show stars" (lambda (&rest _) (show-stars)) warning)
      ("?" "" "?/h" #'show-help nil "<" ">"))
       ;; line 2
      ((,(all-the-icons-faicon "linkedin" :height 1.1 :v-adjust 0.0)
        "Linkedin"
        ""
        (lambda (&rest _) (browse-url "homepage")))
       ("⚑" nil "Show flags" (lambda (&rest _) (message "flag")) error))))

  (initial-buffer-choice (lambda () (get-buffer "*dashboard*"))))

(provide 'dashboard)
