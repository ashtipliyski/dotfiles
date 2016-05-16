(require 'package)
(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

;; hide toolbar and scrollbar by checking if we are running in GUI mode

(when (window-system)
  (tool-bar-mode -1)
  (menu-bar-mode -1)
  (scroll-bar-mode -1))

;; display line numbers
(global-linum-mode 1)

;; display the number of the currently selected column
(column-number-mode 1)

;; highglight the current line
(global-hl-line-mode 1)

;; set font 
;;(set-frame-font "Source Code Pro-11")

;; two lines below were temporarily commented out
(set-frame-font "Source Code Pro Medium-11")
(add-to-list 'default-frame-alist '(font . "Source Code Pro Medium-11"))

;; (set-face-font 'default "Source Code Pro Semibold-11")
(set-face-font 'default "Source Code Pro Medium-11")

;;(setq default-frame-alist '((font . "Source Code Pro-11")))
;;(setq default-frame-alist '((font . "Source Code Pro-11")))
;; (add-to-list 'default-frame-alist '(font . "Source Code Pro-11"))

;; activate visual-line-mode
(global-visual-line-mode t)

;; personal customisation Options->Customize emacs

;; this is added by executing the name of the theme using m-x (color-theme-sanity....)
;; in particular I liked the wombat theme
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (sanityinc-tomorrow-eighties)))
 '(custom-safe-themes
        (quote
         ("20e359ef1818a838aff271a72f0f689f5551a27704bf1c9469a5c2657b417e6c" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; see http://ergoemacs.github.io/ergoemacs-mode for set of customisations that have been suggested

;; to overwrite the highligdfasdfhted text, we can enable delete-selection-mode
(delete-selection-mode t) ;; I am not sure if I am happy with this

;; (blink-cursor-mode t) ;; enables the blinking of the cursor (enabled by default)
(show-paren-mode t) ;; highlights the matching paren on hover

(setq make-backup-file nil) ;; disable backup-files
(setq auto-save-default nil) ;; disable auto-save of files
(setq inhibit-startup-message t) ;; disable welcome message

(setq-default indent-tabs-mode nil) ;; disable use of tabs and use spaces instead
(setq default-tab-width 4) ;; set default indentation width
(setq indent-line-function 'insert-tab) ;; see http://stackoverflow.com/a/1819405

;; overrides the original configuration of yes/no to accept y/n    
; (fset 'yes-or-no-p 'y-or-n-p)

(add-hook 'after-init-hook #'global-flycheck-mode)

;; startup with org-indent-mode enabled
(setq org-startup-indented t)

;; auto-enable ido mode
(require 'ido)
(ido-mode t)

;; set js2-mode to be the default javascript mode
;; (autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;; make web-mode default for HTML files
(add-to-list 'auto-mode-alist '("\\.html$" . web-mode))

;; adds highlighting of lines that are over 80 chars long
;; taken from http://emacsredux.com/blog/2013/05/31/highlight-lines-that-exceed-a-certain-length-limit/
(require 'whitespace)
(setq whitespace-line-column 80) ;; limit line length
(setq whitespace-style '(face lines-tail))

(add-hook 'prog-mode-hook 'whitespace-mode)

;; auto-load flyspell from https://liuchuan.org/files/config/emacs.html
(require 'flyspell)
;(add-to-list 'auto-mode-alist '("\\.txt$" . flyspell-mode))
;(add-to-list 'auto-mode-alist '("\\.org$" . flyspell-mode))
;(add-to-list 'auto-mode-alist '("\\.md$" . flyspell-mode))

;; taken from http://stackoverflow.com/a/15893530
(add-hook 'text-mode-hook 'flyspell-mode)
;; (add-hook 'prog-mode-hook 'flyspell-prog-mode)

;disable backup
(setq backup-inhibited t)
;disable auto save
(setq auto-save-default nil)
    
(add-hook 'c++-mode-hook
          (lambda () (setq flycheck-gcc-include-path
                           (list "/opt/root5/include"))))

    
(add-hook 'c++-mode-hook
          (lambda () (setq flycheck-clang-include-path
                           (list "/opt/root5/include"))))

(require 'ein)    
(setq tramp-default-method "ssh")
(setq linum-format "%4d ")
(load-theme 'zenburn' t)
;; set emacs window to have transparency (unfortunatelly it gets applied to whole app, not just background)
;; (set-frame-parameter (selected-frame) 'alpha '(85 85))
;; (add-to-list 'default-frame-alist '(alpha 85 85))

; hide password when doing sudo commands in eshell                                                       
(add-hook 'comint-output-filter-functions
          'comint-watch-for-password-prompt)

