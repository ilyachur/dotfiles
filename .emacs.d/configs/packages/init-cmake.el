(require 'rtags)

(add-hook 'c-mode-hook 'rtags-start-process-unless-running)
(add-hook 'c++-mode-hook 'rtags-start-process-unless-running)
(add-hook 'objc-mode-hook 'rtags-start-process-unless-running)

(lambda nil
           (with-helm-default-directory
               (cmake-ide--get-build-dir)
               (call-interactively 'helm-make)))
(cmake-ide-setup)

(provide 'init-cmake)
