(require 'use-package)

(defun kill-current-buf ()
  "Starts a fzf session at the root of the current git."
  (interactive)
  (kill-buffer nil))

(use-package evil
    ;; :after helm
    :ensure t
    :init
    (setq evil-want-integration nil)
    (setq evil-want-C-u-scroll t)
    :config
    (evil-mode 1)
    (define-key evil-normal-state-map (kbd "C-k") 'evil-window-decrease-height)
    (define-key evil-normal-state-map (kbd "C-j") 'evil-window-increase-height)
    (define-key evil-normal-state-map (kbd "C-h") 'evil-window-decrease-width)
    (define-key evil-normal-state-map (kbd "C-l") 'evil-window-increase-width))

(use-package evil-leader
    :after evil
    :ensure t
    :config
    (global-evil-leader-mode)
    (evil-leader/set-leader ",")
    (evil-leader/set-key
        "b" 'ido-switch-buffer
        "ci" 'evilnc-comment-or-uncomment-lines
        "cl" 'evilnc-quick-comment-or-uncomment-to-the-line
        "ll" 'evilnc-quick-comment-or-uncomment-to-the-line
        "cc" 'evilnc-copy-and-comment-lines
        "cp" 'evilnc-comment-or-uncomment-paragraphs
        "cr" 'comment-or-uncomment-region
        "cv" 'evilnc-toggle-invert-comment-line-by-line
        "."  'evilnc-copy-and-comment-operator
        "\\" 'evilnc-comment-operator ; if you prefer backslash key

        "ft" 'rg
        "ff" 'projectile-find-file
        "q" 'kill-current-buf
    ))

(use-package linum-relative
    :after evil
    :ensure t
    :config
    (linum-relative-global-mode)
    (setq linum-relative-with-helm t)
    (setq linum-relative-current-symbol ""))

(use-package evil-nerd-commenter
    :after evil)

(use-package evil-mc
    :after evil
    :config
    (global-evil-mc-mode  1))

(use-package evil-magit
    :after (evil magit))

(use-package evil-ediff
    :after evil)

;; (use-package evil-markdown
;;     :after (evil markdown-mode)
;;     :ensure t)

(provide 'init-evil)
