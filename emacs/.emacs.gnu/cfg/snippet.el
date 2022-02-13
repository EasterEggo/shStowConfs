(use-package yasnippet
  :init
  (yas-global-mode)
  :custom
  (setq yas-snippet-dirs '("~/.emacs.d/cfg/snippets")))

(auto-insert-mode)
(setq auto-insert-query nil)

(provide 'snippet)
