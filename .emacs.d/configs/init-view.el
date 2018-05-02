(use-package gruvbox-theme
    :config
    (load-theme 'gruvbox-dark-soft t))

(use-package powerline
    :config
    (powerline-default-theme))
(use-package powerline-evil
    :config
    (powerline-evil-center-color-theme))

;; Indent lines
(use-package highlight-indent-guides
    :config
    (add-hook 'prog-mode-hook 'highlight-indent-guides-mode))

(use-package dashboard
    :config
    (dashboard-setup-startup-hook))

;; (use-package symon
;;     :config
;;     (symon-mode))

(provide 'init-view)
