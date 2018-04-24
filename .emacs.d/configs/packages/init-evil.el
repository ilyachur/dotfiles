(setq evil-want-integration nil)
(require 'evil)
(evil-mode)
(require 'evil-collection)
(evil-collection-init)

(require 'evil-leader)
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
)

;; lines like vim style
(require 'linum-relative)
(linum-relative-global-mode)
(setq linum-relative-with-helm t)
(setq linum-relative-current-symbol "")

(provide 'init-evil)
