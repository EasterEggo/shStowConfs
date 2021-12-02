(setq auto-insert-directory "~/.emacs.d/cfg/snippets")
(auto-insert-mode)
(setq auto-insert-query nil)

(defun autoinsert-yas-expand()
      "Replace text in yasnippet template."
      (yas/expand-snippet (buffer-string) (point-min) (point-max)))

(setq auto-insert-alist '(
			  (("\\.c\\'" . "c template") . ["c-mode/__c" autoinsert-yas-expand])
			  )
      )

(provide 'auto-insert)
