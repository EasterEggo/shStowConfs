(use-package org-roam
  :init
  (setq org-roam-v2-ack t)
  :config
  (require 'org-protocol)
  (setq org-roam-directory (file-truename "~/org/roam")
        org-roam-protocol-store-links "~/org/roam"
        org-roam-complete-everywhere t
        org-roam-db-autosync-mode t)
  :general
  (:states 'normal
           "<SPC>ni" 'org-roam-node-insert))

(use-package org-roam-ui
  :straight
  (:host github :repo "org-roam/org-roam-ui" :branch "main" :files ("*.el" "out"))
  :after org-roam
  :config
  (setq org-roam-ui-sync-theme t
        org-roam-ui-follow t
        org-roam-ui-update-on-save t
        org-roam-ui-open-on-start t))

(use-package org-bullets :ghook 'org-mode-hook)

(use-package org
  :gfhook
  ('org-mode-hook (list #'org-indent-mode #'variable-pitch-mode #'visual-line-mode))
  :custom
  (org-agenda-files '("~/org/master.org"))
  (org-hide-emphasis-markers t))

(let* ((variable-tuple
      (cond ((x-list-fonts "SourceSansPro")         '(:font "SourceSansPro"))
            (nil (warn "Cannot find a Sans Serif Font.  Install Source Sans Pro."))))
     (base-font-color     (face-foreground 'default nil 'default))
     (headline           `(:inherit default :weight bold :foreground ,base-font-color)))

(custom-theme-set-faces
 'user
 `(org-level-8 ((t (,@headline ,@variable-tuple))))
 `(org-level-7 ((t (,@headline ,@variable-tuple))))
 `(org-level-6 ((t (,@headline ,@variable-tuple))))
 `(org-level-5 ((t (,@headline ,@variable-tuple))))
 `(org-level-4 ((t (,@headline ,@variable-tuple :height 1.1))))
 `(org-level-3 ((t (,@headline ,@variable-tuple :height 1.25))))
 `(org-level-2 ((t (,@headline ,@variable-tuple :height 1.5))))
 `(org-level-1 ((t (,@headline ,@variable-tuple :height 1.75))))
 `(org-document-title ((t (,@headline ,@variable-tuple :height 2.0 :underline nil))))

 '(fixed-pitch ((t (:family "JetBrainsMono Nerd Font" :height 120))))
 '(variable-pitch ((t (:family "SourceSansPro" :height 130))))

 '(org-code ((t (:inherit fixed-pitch))))
 '(org-block ((t (:inherit fixed-pitch))))))

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

(use-package pdf-tools
  :custom (pdf-loader-install t))

(provide 'prod)
