(require 'use-package)

(use-package rg
    ;; :chords (":G" . rg-project)
    :ensure-system-package rg)

(use-package ripgrep
    :ensure-system-package rg)

(provide 'init-search)
