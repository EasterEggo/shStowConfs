(defun lsp (server-hook)
  (add-hook server-hook #'lsp-deferred))
(defalias 'yes-or-no-p 'y-or-n-p)

(provide 'func)
