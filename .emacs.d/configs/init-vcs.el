(require 'use-package)

(use-package magit
    :ensure t)

(use-package vdiff-magit
    :ensure t
    :after (magit vdiff)
    :bind (:map magit-mode-map
              ("e" . vdiff-magit-dwim)
              ("E" . vdiff-magit-popup)))


;; (use-package magit-blame
;;     :after magit)
;; (use-package git-gutter
;;     :ensure t
;;     :config
;; 	(global-git-gutter-mode t)
;; 	(git-gutter:linum-setup)

;; 	(setq git-gutter:modified-sign "~") ;; two space
;; 	(setq git-gutter:added-sign "+")    ;; multiple character is OK
;; 	(setq git-gutter:deleted-sign "-")
;; 	(setq git-gutter:separator-sign "|")

;; 	(set-face-foreground 'git-gutter:separator "black")
;; 	(set-face-foreground 'git-gutter:added "green")
;; 	(set-face-foreground 'git-gutter:deleted "red")
;; 	(set-face-foreground 'git-gutter:modified "yellow"))


(provide 'init-vcs)
