;; Disable backup/autosave files
(setq make-backup-files        nil)
(setq auto-save-default        nil)
(setq auto-save-list-file-name nil)

;;; make all "yes or no" prompts show "y or n" instead
(fset 'yes-or-no-p 'y-or-n-p)

;; System-type definition
(defun system-is-linux()
    (string-equal system-type "gnu/linux"))
(defun system-is-windows()
    (string-equal system-type "windows-nt"))

;; Start Emacs as a server
(when (system-is-linux)
    (require 'server)
    (unless (server-running-p)
        (server-start)))

;; Disable menu bar
(menu-bar-mode      -1)
(tooltip-mode       -1)
(tool-bar-mode      -1) ;; disable tool-bar

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
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default c-basic-offset 4)
(setq-default standart-indent 4)

;; Scrolling settings
(setq scroll-step 1)
(setq scroll-margin 5)
(setq scroll-conservatively 10000)
(setq compilation-scroll-output t)

;; Clipboard settings
(setq x-select-enable-clipboard t)
(setq select-enable-primary t)
(setq select-enable-clipboard t)
(setq save-interprogram-paste-before-kill t)

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
