;;; start package.el with emacs
(require 'package)

;;; add MELPA to repository list
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
;;;(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
;;; initialize package.el
(package-initialize)

;;; add necessary packages
(defconst packages-list '(
                             evil                ;; Vim mode
                             evil-leader
                             evil-collection
                             evil-nerd-commenter
                             linum-relative
                             magit               ;; work with git
                             cmake-ide           ;; Cmake build support
                             cmake-mode
                             editorconfig        ;; Editorconfig support
                             neotree             ;; like NERDTree file explorer
                             gruvbox-theme       ;; Color theme
                             ;;	      helm helm-core helm-ctest helm-ls-git
                             flycheck
                             ztree
              ))

(defun install-packages ()
  "Install all required packages."
  (interactive)
  (unless package-archive-contents
    (package-refresh-contents))
  (dolist (package packages-list)
    (unless (package-installed-p package)
      (package-install package))))

(install-packages)

;;(require 'init-helm)
(require 'init-evil)
(require 'init-editorconfig)

(provide 'init-packages)
