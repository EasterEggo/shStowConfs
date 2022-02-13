(use-package exwm
  :config
  (setq exwm-workspace-number 5)
  (exwm-enable))
  (add-hook 'exwm-update-class-hook
            (lambda ()
            (exwm-workspace-rename-buffer exwm-class-name)))

(provide 'exwm)
