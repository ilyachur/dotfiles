(require 'rtags)
(setq rtags-completions-enabled t)
(setq rtags-autostart-diagnostics t)
(rtags-enable-standard-keybindings)

(rtags-start-process-maybe)

(provide 'init-rtags)
