(pkg 'helm)
(helm-mode 1)

(pkg 'lsp-mode)

(pkg 'company)
(pkg 'company-box)
(add-hook 'company-mode-hook 'company-box-mode)

(pkg 'quickrun)

(pkg 'yasnippet)
(setq yas-snippet-dirs '("~/.emacs.d/cfg/snippets"))
(yas-global-mode 1)


(provide 'utils)
