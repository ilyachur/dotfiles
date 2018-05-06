(require 'use-package)

;; C++ highlight
(use-package modern-cpp-font-lock
    :ensure t
    :config
	(modern-c++-font-lock-global-mode t))

(use-package ycmd
    :ensure t
    :init
    (add-hook 'after-init-hook #'global-ycmd-mode)
    :config
    (progn
        (set-variable 'ycmd-server-command `("python" ,(file-truename "~/.emacs.d/ycmd/ycmd/")))
        ;; (set-variable 'ycmd-extra-conf-whitelist my:ycmd-extra-conf-whitelist)
        ;; (set-variable 'ycmd-global-config my:ycmd-global-config)
        (setq ycmd-force-semantic-completion t)
        (use-package company-ycmd
            :ensure t
            :config
            (company-ycmd-setup))

        (use-package flycheck-ycmd
            :ensure t
            :init
            (add-hook 'c-mode-common-hook 'flycheck-ycmd-setup))))

(use-package eldoc
    :config
    (add-hook 'ycmd-mode-hook #'eldoc-mode)
    (add-hook 'racer-mode-hook #'eldoc-mode))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Set up code completion with company
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package company
    :ensure t
    :config
    ;; Zero delay when pressing tab
    (setq company-idle-delay 0)
    (add-hook 'after-init-hook 'global-company-mode)
    ;; remove unused backends
    (setq company-backends (delete 'company-semantic company-backends))
    (setq company-backends (delete 'company-eclim company-backends))
    (setq company-backends (delete 'company-xcode company-backends))
    (setq company-backends (delete 'company-clang company-backends))
    (setq company-backends (delete 'company-bbdb company-backends))
    (setq company-backends (delete 'company-oddmuse company-backends)))

(use-package company-ycmd
    :ensure t
    :after (company ycmd)
    :config
    (company-ycmd-setup))

(use-package flycheck
    :ensure t
    :init (declare-function flycheck-display-error-messages-unless-error-list
						    "Show messages of ERRORS unless the error list is visible.")
    :commands (flycheck-mode)
    :config
	(global-flycheck-mode t))

(use-package flycheck-ycmd
    :ensure t
    :after flycheck
    :config (flycheck-ycmd-setup))

(use-package origami
    :ensure t
    :config
    (global-origami-mode 1))

(use-package disaster)

(use-package realgud
    :ensure t)

(provide 'init-programming)
