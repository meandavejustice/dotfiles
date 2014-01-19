;;; Author: Dave Justice,
;;; URL: http://github.com/meandavejustice/kvn-spacey-theme-emacs

;;; This file is not part of GNU Emacs.

(deftheme kvn-spacey "my custom theme")
(custom-theme-set-faces
  'kvn-spacey
  '(default ((t (:foreground "#c9cac9" :background "#202122"))))
  '(cursor ((t (:background "#fc9e4f"))))
  '(fringe ((t (:background "#2e2e2e"))))
  '(mode-line ((t (:foreground "#e6e6e6" :background "#0ec4be"))))
  '(region ((t (:background "#e42fdf"))))
  '(font-lock-builtin-face ((t (:foreground "#989b92"))))
  '(font-lock-comment-face ((t (:foreground "#fcd279"))))
  '(font-lock-function-name-face ((t (:foreground "#00ede0"))))
  '(font-lock-keyword-face ((t (:foreground "#7a7a7a"))))
  '(font-lock-string-face ((t (:foreground "#fb2de4"))))
  '(font-lock-type-face ((t (:foreground"#00ffe5"))))
  '(font-lock-constant-face ((t (:foreground "#be9760"))))
  '(font-lock-variable-name-face ((t (:foreground "#88e796"))))
  '(minibuffer-prompt ((t (:foreground "#c66bfa" :bold t))))
  '(font-lock-warning-face ((t (:foreground "red" :bold t))))
)
(provide-theme 'kvn-spacey)

