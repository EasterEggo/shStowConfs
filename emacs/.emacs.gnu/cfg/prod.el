(use-package org-roam
  :init
  (setq org-roam-v2-ack t)
  :custom
  (org-roam-directory (file-truename "~/org/roam"))
  (org-roam-complete-everywhere t)
  (org-roam-db-autosync-mode t)
  :general
  (:states 'normal
           "<SPC>ni" 'org-roam-node-insert))


(require 'org-roam-protocol)
(setq org-roam-protocol-store-links "~/org/roam")
(setq org-roam-capture-ref-templates
      '(("r" "ref" plain (function org-roam-capture--get-point)
         "%?"
         :file-name "${slug}"
         :head "#+TITLE: ${title} ,#+ROAM_KEY: ${ref}"
         :unnarrowed t)))

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

(use-package toc-org
  :ghook 'org-mode-hook)

(use-package org
  :gfhook
  ('org-mode-hook (list #'org-indent-mode #'variable-pitch-mode #'visual-line-mode))
  :custom
  (org-agenda-files '("~/org/master.org"))
  (org-hide-emphasis-markers t))

(let* ((variable-tuple
      (cond ((x-list-fonts "Ubuntu Nerd Font")         '(:font "Ubuntu Nerd Font"))
            (nil (warn "Install Ubuntu Nerd Font."))))
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
 '(variable-pitch ((t (:family "Ubuntu Nerd Font" :height 130))))

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

(use-package olivetti)

(use-package ag
  :straight rg t)

(use-package pdf-tools
  :custom
  (pdf-loader-install t)
  (pdf-tools-install t))

(use-package centaur-tabs
  :config
  (centaur-tabs-mode t)
  (setq centaur-tabs-set-icons t)
  (setq centaur-tabs-set-bar 'left)
  (setq centaur-tabs-height 32)
  (setq centaur-tabs-set-modified-marker t)
  (setq centaur-tabs-gray-out-icons 'buffer))

(provide 'prod)
