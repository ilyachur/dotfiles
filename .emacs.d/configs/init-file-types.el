(use-package markdown-mode
    :ensure t
    :commands (markdown-mode gfm-mode)
    :mode (("README\\.md\\'" . gfm-mode)
              ("\\.md\\'" . markdown-mode)
              ("\\.markdown\\'" . markdown-mode))
    :init (setq markdown-command "multimarkdown"))

(setq caffe-mode-highlights
    '(("#+.*" . font-lock-comment-face)
         ("'.*'" . font-lock-string-face)
         (".*\s{\\|}" . font-lock-function-name-face)
         ("^\s*.+:" . font-lock-keyword-face)
         ("[A-Z]" . font-lock-constant-face)
         ("false\\|true" . font-lock-constant-face)
         ("[0-9]*.?[0-9]*e?[0-9]*" . font-lock-constant-face)
         (".*" . font-lock-defaults)
         ))

(define-derived-mode caffe-mode fundamental-mode
    (setq font-lock-defaults '(caffe-mode-highlights))
    (setq comment-start "#")
    (setq mode-name "Caffe"))

(add-to-list 'auto-mode-alist '("\\.prototxt\\'" . caffe-mode))

(provide 'init-file-types)
