(require 'use-package)

(use-package ido
    :ensure t
    :init
    (progn
        (ido-mode 1)
        (ido-everywhere 1)
        (use-package ido-vertical-mode
        :init (ido-vertical-mode 1))
        (use-package flx-ido
        :init (flx-ido-mode 1))
        (use-package smex
        :init (smex-initialize)
        :bind ("M-x" . smex)))
    :config
    (progn
        (setq ido-enable-prefix nil
            ido-enable-flex-matching t
            ido-case-fold t
            ido-create-new-buffer 'always
            ido-use-filename-at-point nil
            ido-max-prospects 10)
        (add-to-list 'ido-ignore-files "\\.DS_Store")))

(use-package ido-completing-read+
    :ensure t
    :config
    (ido-ubiquitous-mode 1))
  

(provide 'init-search)
