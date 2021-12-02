(defun pkg(package)
  (straight-use-package package))

(defun engbind(key cmd)
  (evil-define-key 'normal 'global (kbd key) cmd))

(defun font (dfnt)
  (set-face-attribute 'default nil :font dfnt )
  (setq default-frame-alist '((font . dfnt)))
)

(provide 'func)
