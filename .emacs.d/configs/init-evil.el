(require 'use-package)

(defun kill-current-buf ()
  "Starts a fzf session at the root of the current git."
  (interactive)
  (kill-buffer nil))

(use-package evil
    :after helm
    :ensure t
    :init
    (setq evil-want-integration nil)
    :config
    (evil-mode 1))

(use-package evil-collection
    :after evil
    :ensure t
    :config
    (evil-collection-init))

(use-package evil-leader
    :after evil
    :ensure t
    :config
    (global-evil-leader-mode)
    (evil-leader/set-leader ",")
    (evil-leader/set-key
        "ci" 'evilnc-comment-or-uncomment-lines
        "cl" 'evilnc-quick-comment-or-uncomment-to-the-line
        "ll" 'evilnc-quick-comment-or-uncomment-to-the-line
        "cc" 'evilnc-copy-and-comment-lines
        "cp" 'evilnc-comment-or-uncomment-paragraphs
        "cr" 'comment-or-uncomment-region
        "cv" 'evilnc-toggle-invert-comment-line-by-line
        "."  'evilnc-copy-and-comment-operator
        "\\" 'evilnc-comment-operator ; if you prefer backslash key

        "f" 'fzf-git
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
    :after evil)

(use-package evil-magit
    :after (evil magit))

(provide 'init-evil)
