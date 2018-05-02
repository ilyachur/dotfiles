(require 'use-package)

(use-package neotree
    :after evil
    :ensure t
	:init
	(progn
		;; Do not allow neotree to be the only open window
		(setq-default neo-dont-be-alone t))
    :config
    (evil-set-initial-state 'neotree-mode 'normal)
    (evil-define-key 'normal neotree-mode-map
        (kbd "RET") 'neotree-enter
        (kbd "c")   'neotree-create-node
        (kbd "r")   'neotree-rename-node
        (kbd "d")   'neotree-delete-node
        (kbd "j")   'neotree-next-node
        (kbd "k")   'neotree-previous-node
        (kbd "g")   'neotree-refresh
        (kbd "C")   'neotree-change-root
        (kbd "I")   'neotree-hidden-file-toggle
        (kbd "H")   'neotree-hidden-file-toggle
        (kbd "q")   'neotree-hide
        (kbd "l")   'neotree-enter
        ))

(use-package ztree-diff
    :ensure ztree)

(use-package projectile
    :ensure t
    :config
    (projectile-mode))

(provide 'init-file-explorer)
