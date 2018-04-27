;;; start package.el with emacs
(require 'package)

;;; add MELPA to repository list
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
;;;(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))

(setq package-enable-at-startup nil)
(package-initialize nil)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
	(package-refresh-contents)
	(package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;;; add necessary packages
;; (defconst packages-list '(
;;                              helm
;;                              helm-make
;;                              magit               ;; work with git hav
;;                              cmake-ide           ;; Cmake build support
;;                              cmake-mode
;;                              editorconfig        ;; Editorconfig support
;;                              neotree             ;; like NERDTree file explorer
;;                              gruvbox-theme       ;; Color theme
;;                              flycheck
;;                              tabbar
;;                              tabbar-ruler
;;                              powerline
;;                              fzf                 ;; fzf frontend
;;                              rg
;;                              rtags
;;                              wgrep
;;                              ztree
;;                              evil                ;; Vim mode
;;                              evil-mc
;;                              evil-leader
;;                              evil-collection
;;                              evil-nerd-commenter
;;                              linum-relative

;;                              ;; Go to
;;                              dumb-jump
;;               ))

;; (defun install-packages ()
;;   "Install all required packages."
;;   (interactive)
;;   (unless package-archive-contents
;;     (package-refresh-contents))
;;   (dolist (package packages-list)
;;     (unless (package-installed-p package)
;;       (package-install package))))

;; (install-packages)

(require 'init-helm)
(require 'init-cmake)
(require 'init-rtags)
(require 'init-evil)
(require 'init-fzf)
(require 'init-editorconfig)
(require 'init-view)

(provide 'init-packages)
