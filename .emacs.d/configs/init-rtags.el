(require 'use-package)

(use-package rtags
    :config
    (setq rtags-autostart-diagnostics t)
    (rtags-diagnostics)
    (setq rtags-completions-enabled t)
    (setq rtags-autostart-diagnostics t)
    (rtags-enable-standard-keybindings)

    (rtags-start-process-maybe))

(provide 'init-rtags)
