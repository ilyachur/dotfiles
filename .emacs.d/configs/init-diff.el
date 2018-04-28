(require 'use-package)

(use-package vdiff
    :ensure t
    :after evil
    :config
    (evil-define-key 'normal vdiff-mode-map "," vdiff-mode-prefix-map))

(provide 'init-diff)
