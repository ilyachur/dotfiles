(add-to-list 'load-path "~/.emacs.d/configs/editor")
(add-to-list 'load-path "~/.emacs.d/configs/packages")
(add-to-list 'load-path "~/.emacs.d/configs/file_types")

(require 'init-packages)
(require 'init-editor)
(require 'init-file-types)

(provide 'common-init)
