(require 'rtags)

(use-package cmake-mode
    :mode (("CMakeLists\\.txt\\'" . cmake-mode)
              ("\\.cmake\\'" . cmake-mode))
    :init (setq cmake-tab-width 4))

(use-package cmake-ide
    :after rtags
    :config
    (cmake-ide-setup))

(provide 'init-cmake)
