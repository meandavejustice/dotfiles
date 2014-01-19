(load-theme 'kvn-spacey t)

(require 'package)

;; Add the original Emacs Lisp Package Archive
(add-to-list 'package-archives
  '("elpa" . "http://tromey.com/elpa/"))

(add-to-list 'package-archives
  '("marmalade" . "http://marmalade-repo.org/packages/"))

(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/"))

(package-initialize)

;; Defaults
(if (fboundp `menu-bar-mode) (menu-bar-mode -1)) ;; minimal chrome
(if (fboundp `tool-bar-mode) (tool-bar-mode -1)) ;; no toolbar
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(defalias 'qrr 'query-regexp-replace)
(defalias 'yes-or-no-p 'y-or-n-p) ;; only type  y  instead of  yes 
(setq inhibit-splash-screen t) ;; no splash screen
(setq-default indent-tabs-mode nil)      ;; no tabs!
(setq fill-column 80) ;; M-q should fill at 80 chars, not 75
(setq-default truncate-lines 1) ;; no wordwrap

(desktop-save-mode 1) ;; auto-save buffer state on close for a later time.

(require 'fill-column-indicator) ;; line indicationg some edge column

;; normalize copy and paste for osx
(defun copy-from-osx ()
  (shell-command-to-string "pbpaste"))
(defun paste-to-osx (text &optional push)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))
(if (eq system-type 'darwin)
    (progn
      (setq interprogram-cut-function 'paste-to-osx)
      (setq interprogram-paste-function 'copy-from-osx)))

;; global package preferences
(require 'pretty-mode)
(global-pretty-mode t)

;multiple-cursors
(require 'multiple-cursors)
(global-set-key (kbd "C-c C-p") 'mc/edit-lines)


; shell
;; (setq explicit-shell-file-name "zsh")
;; (setq explicit-bash-args '("-c" "export EMACS=; stty echo; bash"))
;; (setq comint-process-echoes t)

; yasnippet
(add-to-list 'load-path
                "~/.emacs.d/elpa/yasnippet-0.8.0/")
   (require 'yasnippet)
   (yas-global-mode 1)

(add-to-list 'load-path "~/path-to/auto-complete")
; Load the default configuration
(require 'auto-complete-config)
; Make sure we can find the dictionaries
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20130724/dict")
; Use dictionaries by default
(setq-default ac-sources (add-to-list 'ac-sources 'ac-source-dictionary))
(global-auto-complete-mode t)
; Start auto-completion after 2 characters of a word
(setq ac-auto-start 2)
; case sensitivity is important when finding matches
(setq ac-ignore-case nil)

; Emmet mode
(require 'emmet-mode)

(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.

(add-hook 'emmet-mode-hook (lambda () (setq emmet-indentation 2))) ;; indent 2 spaces.
(setq emmet-move-cursor-between-quotes t) ;; default nil

; emmet autocomplete

(require 'ac-emmet) ;; Not necessary if using ELPA package
(add-hook 'sgml-mode-hook 'ac-emmet-html-setup)
(add-hook 'css-mode-hook 'ac-emmet-css-setup)

;; ;tern
;; (add-to-list 'load-path "/Code/Projects/tern/emacs/")
;; (autoload 'tern-mode "tern.el" nil t)

(require 'sr-speedbar)

(setq speedbar-use-images nil)
(setq speedbar-show-unknown-files t)
(setq sr-speedbar-auto-refresh 0)
(setq sr-speedbar-width-x 20)
(setq sr-speedbar-max-width 20)

(global-set-key (kbd "C-x C-y") 'sr-speedbar-toggle)
(global-set-key (kbd "C-x C-j") 'sr-speedbar-refresh-toggle)

(when window-system
  (sr-speedbar-open))

;(with-current-buffer sr-speedbar-buffer-name
;  (setq window-size-fixed 'width))


;; Flymake
(require 'flymake-jshint)
(setq flymake-gui-warnings-enabled nil)
(add-hook 'js-mode-hook 'flymake-jshint-load)
(add-hook 'js-mode-hook 'flymake-mode)
 
 
(defun voorhees-flymake-show-error (prefix)
  (interactive "p")
  (if prefix
      (flymake-goto-next-error)
    (flymake-goto-prev-error))
  (flymake-display-err-menu-for-current-line))
 
(global-set-key "\C-c\C-v" 'voorhees-flymake-show-error)



;; Syntax specific preferences

;; common lisp interpreter

(load (expand-file-name "~/quicklisp/slime-helper.el"))
(setq inferior-lisp-program "/usr/local/bin/sbcl")

; jScript
(add-to-list 'auto-mode-alist '("\\.js\\'" . js-mode))
(setq js-indent-level 2)

;js-doc
(setq js-doc-mail-address "davejustishh@gmail.com"
      js-doc-author (format "Dave Justice <%s>" js-doc-mail-address)
      js-doc-url "meandavejustice.github.com"
      js-doc-license "MIT")

(add-hook 'js-mode-hook
          #'(lambda ()
              (define-key js2-mode-map "\C-ci" 'js-doc-insert-function-doc)
              (define-key js2-mode-map "@" 'js-doc-insert-tag)))


;tern
(add-hook 'js-mode-hook (lambda () (tern-mode t)))

; function => lambda
(defun js-lambda () (interactive) (insert "function () {
  };")
  (backward-char 6))
 
  (defun js-pretty-lambdas ()
  (font-lock-add-keywords
  nil `(("\\(function *\\)("
  (0 (progn (compose-region (match-beginning 1) (match-end 1)
  , (make-char 'greek-iso8859-7 107))
  nil))))))

(add-hook 'js-mode-hook 'js-pretty-lambdas)
(eval-after-load 'js-mode
  '(define-key js-mode-map (kbd "C-c l") 'js-lambda))


; set up prettier json files
(require 'json-mode)
(add-to-list 'auto-mode-alist '("\\.json\\'" .json-mode))

; CSS defaults
(setq css-indent-offset 2)

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.hb\\.html\\ " . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\ " . web-mode))
; everything is indented 2 spaces
(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)

(require 'server)
(unless (server-running-p)
    (server-start))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("0c311fb22e6197daba9123f43da98f273d2bfaeeaeb653007ad1ee77f0003037" "465be5317c7d95a84e376e095c21242f4f2ad75692ed806dcbb6fe27078260f1" "579e9950513524d8739e08eae289419cfcb64ed9b7cc910dd2e66151c77975c4" "d56c00a2a8d526cf32671f6d79ffe49dc71af6aa6657a5be6900aa9a9d2e7f2d" "cda6dc4c6fca6a56e7f372d2bedc2b07c3f8e3ffeee9e9da92a831f9b92e6cc0" "636ecbf1091fbc99d95526d7a3a4810d1ccb58997e58bd3184863821303553f3" "1177fe4645eb8db34ee151ce45518e47cc4595c3e72c55dc07df03ab353ad132" default)))
 '(frame-brackground-mode (quote dark))
 '(safe-local-variable-values (quote ((jshint-configuration-path . "/Users/meandave/Code/Werk/sprint.ly/.jshintrc") (jshint-configuration-path . "/Users/meandave/Code/Werk/sprint.ly/js_test/.jshintrc")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;;; search funcs from @andskiba
;; https://bitbucket.org/andskiba/emacs-config

(defun as/prelude-google ()
  "Googles a query or region if any."
  (interactive)
  (browse-url
   (concat
    "http://www.google.com/search?ie=utf-8&oe=utf-8&q="
    (if mark-active
        (buffer-substring (region-beginning) (region-end))
        (read-string "Google: ")))))

(defmacro def-as-doc-search (fn-name def-prompt prompt url)
  `(defun ,fn-name (str)
    (interactive
     (let ((str (thing-at-point 'symbol))
           (enable-recursive-minibuffers t))
       (list (read-from-minibuffer
              (if str
                  (format ,def-prompt str) ,prompt)
              str))))
    (browse-url (format ,url str))))

(def-as-doc-search as/php-doc-search
  "PHP docs search (default %s): "
  "PHP docs search: "
  "http://www.php.net/manual-lookup.php?pattern=%s&lang=en&scope=quickref")

(def-as-doc-search as/mysql-doc-search
  "MySQL docs search (default %s): "
  "MySQL docs search: "
  "http://search.oracle.com/search/search?q=%s&group=MySQL")

(def-as-doc-search as/mdn-doc-search
  "MDN search (default %s): "
  "MDN search: "
  "https://developer.mozilla.org/en-US/search?q=%s")

(def-as-doc-search as/merriam-webster-search
  "M-W dictionary (default %s): "
  "M-W dictionary: "
  "http://www.merriam-webster.com/dictionary/%s")

(global-set-key (kbd "C-c s m") 'as/mysql-doc-search)
(global-set-key (kbd "C-c s j") 'as/mdn-doc-search)
(global-set-key (kbd "C-c s g") 'as/prelude-google)
(global-set-key (kbd "C-c s d") 'as/merriam-webster-search)
