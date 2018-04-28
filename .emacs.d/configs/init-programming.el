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
        (set-variable 'ycmd-server-command '("python"  "/Users/ichuraev/.emacs.d/ycmd/ycmd"))
        ;; (set-variable 'ycmd-extra-conf-whitelist my:ycmd-extra-conf-whitelist)
        ;; (set-variable 'ycmd-global-config my:ycmd-global-config)
        (setq ycmd-force-semantic-completion t)
        (use-package company-ycmd
          :ensure t
          :config
          (company-ycmd-setup)
          )

        (use-package flycheck-ycmd
          :ensure t
          :init
          (add-hook 'c-mode-common-hook 'flycheck-ycmd-setup)
          )

        ;; Add displaying the function arguments in mini buffer using El Doc
        ;; (use-package ycmd-eldoc
        ;;   :init
        ;;   ;; For some reason ycmd-eldoc doesn't work properly in Python mode.
        ;;   ;; I get a "connection refused" error when it connects to JediHTTP
        ;;   (add-hook 'c-mode-common-hook
        ;;             (lambda ()
        ;;               (ycmd-eldoc-mode t)))
        ;;   )
        )
      )

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
  (setq company-backends (delete 'company-oddmuse company-backends))
  )

(use-package flycheck
    :init (declare-function flycheck-display-error-messages-unless-error-list
						    "Show messages of ERRORS unless the error list is visible.")
    :commands (flycheck-mode)
    :config
	(global-flycheck-mode t)
	(message "Flycheck loaded."))

(provide 'init-programming)
