(use-package evil
  :config (evil-mode 1))
(use-package general)
(use-package which-key
  :config
  (which-key-mode 1))

(general-define-key
 :states 'normal
 "<SPC><SPC>" 'execute-extended-command
 "<SPC>." 'find-file
 "<SPC><" 'switch-to-buffer

 "<SPC>ni" 'org-roam-node-insert
 "<SPC>nf" 'org-roam-node-find
 "<SPC>nl" 'org-roam-buffer-toggle)

(provide 'bindings)
