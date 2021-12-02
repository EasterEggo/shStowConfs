(pkg 'evil)
(evil-mode 1)

(engbind "<SPC><SPC>" 'helm-M-x)
(engbind "<SPC>." 'helm-find-files)
(engbind "<SPC>r" 'helm-recentf)
(engbind "<SPC>b" 'helm-bookmarks)
(engbind "<SPC><" 'helm-buffers-list)

(provide 'bindings)
