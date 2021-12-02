(straight-use-package 'jupyter)

(add-hook 'python-mode-hook #'lsp-deferred)

(provide 'py)
