(pkg 'rust-mode)
(add-hook 'rust-mode-hook #'lsp-deferred)

(provide 'rs)
