(require 'use-package)

(use-package helm
    :ensure t
    :config
    (helm-mode 1)
    (helm-linum-relative-mode 1))

(use-package helm-make
  :bind (("C-c m" . helm-make-projectile))
  :config (setq helm-make-sort-targets t))

(provide 'init-helm)
