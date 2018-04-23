;; Show-paren-mode settings
(show-paren-mode t)
(setq show-paren-style 'expression)

(setq ring-bell-function 'ignore)   ;; mute sound
(setq enable-local-variables :all)

(setq display-time-24hr-format t)
(display-time-mode t)

(size-indication-mode t)

(savehist-mode 1)

;; Indent settings
(setq-default tab-width 4)
(setq-default c-basic-offset 4)
(setq-default standart-indent 4)

;; Scrolling settings
(setq scroll-step 1)
(setq scroll-margin 5)
(setq scroll-conservatively 10000)

;; Clipboard settings
(setq x-select-enable-clipboard t)

(setq next-line-add-newlines nil)
(setq require-final-newline nil)

;; Highlight search resaults
(setq search-highlight        t)
(setq query-replace-highlight t)

;; remember cursor position
(if (version< emacs-version "25.0")
    (progn
      (require 'saveplace)
      (setq-default save-place t))
  (save-place-mode 1))

(provide 'init-common)
