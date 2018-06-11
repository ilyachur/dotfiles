(require 'use-package)

(if (executable-find "rg")
    (use-package rg
        :ensure-system-package rg))

(use-package wgrep
    :ensure t)

(provide 'init-search)
