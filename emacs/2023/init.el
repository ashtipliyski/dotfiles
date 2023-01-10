; (require 'package)
; (package-initialize)
                                        ; (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

(setenv "PATH" (concat (getenv "PATH") ":~/go"))


(require 'package)
    (add-to-list
     'package-archives
     '("melpa" . "https://melpa.org/packages/")
     t)

;; hide toolbar and scrollbar by checking if we are running in GUI mode

;; gopls
(require 'lsp-mode)
(add-hook 'go-mode-hook #'lsp-deferred)

;; Set up before-save hooks to format buffer and add/delete imports.
;; Make sure you don't have other gofmt/goimports hooks enabled.
(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))
(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)

(scroll-bar-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(setq inhibit-startup-screen t)


(add-hook 'go-mode-hook
          (lambda ()
            (setq indent-tabs-mode 1)
            (setq tab-width 2)))

;; display line numbers
(global-linum-mode -1)

;; display the number of the currently selected column
(column-number-mode 1)

;; highglight the current line
(global-hl-line-mode 1)

;; set font 
;;(set-frame-font "Source Code Pro-11")

;; two lines below were temporarily commented out
;; (set-frame-font "Source Code Pro Medium-10")
;; (add-to-list 'default-frame-alist '(font . "Source Code Pro Medium-10"))

;; (set-face-font 'default "Source Code Pro Semibold-11")
;; (set-face-font 'default "Source Code Pro Medium-10")

;;(setq default-frame-alist '((font . "Source Code Pro-11")))
;;(setq default-frame-alist '((font . "Source Code Pro-11")))
;; (add-to-list 'default-frame-alist '(font . "Source Code Pro-11"))

;; activate visual-line-mode
(global-visual-line-mode t)

;; personal customisation Options->Customize emacs


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

;; (add-hook 'after-init-hook #'global-flycheck-mode)

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

;; emacs ipython notebook mode
;; (require 'ein)    
(setq tramp-default-method "ssh")
(setq linum-format "%4d ")
(load-theme 'zenburn' t)
;; (load-theme 'monokai' t)
;; (load-theme 'ample' t)
;; set emacs window to have transparency (unfortunatelly it gets applied to whole app, not just background)
;; (set-frame-parameter (selected-frame) 'alpha '(85 85))
;; (add-to-list 'default-frame-alist '(alpha 85 85))

; hide password when doing sudo commands in eshell                                                       
(add-hook 'comint-output-filter-functions
          'comint-watch-for-password-prompt)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("fee7287586b17efbfda432f05539b58e86e059e78006ce9237b8732fde991b4c" default))
 '(package-selected-packages
   '(lsp-ui dap-mode lsp-mode solarized-theme markdown-mode markdown-preview-eww ace-window tango-2-theme ivy monokai-theme zenburn-theme go-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(scroll-bar-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(setq inhibit-startup-screen t)

;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(default ((t (:stipple nil :background "white" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 130 :width normal :family "Inconsolata")))))


;; packages
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(package-refresh-contents)

;; Default location of backups
(setq backup-directory-alist `(("." . "~/.emacs.d/saves")))

;; word wrap
(global-visual-line-mode t)

;; auto-indent
(electric-indent-mode t)

;; tab size
(setq default-tab-width 2)
(add-hook 'go-mode-hook
          (lambda ()
            (setq indent-tabs-mode 1)
            (setq tab-width 2)))

;;
(blink-cursor-mode -1)

;; disable electric indent for org mode
(add-hook 'org-mode-hook
          (lambda ()
            (set (make-local-variable 'electric-indent-functions)
                 (list (lambda (arg) 'no-indent)))))

;; enable flyspell for org mode by default
(add-hook 'org-mode-hook 'turn-on-flyspell)

;; disable funny indent for org mode - this should be disabled for org only
;; (electric-indent-mode -1)

;; ivy helps with listing buffers, etc
(require 'ivy)
; (ivy-mode 1)

;; enable custom key for switching between windows with ace-window
(global-set-key (kbd "M-o") 'ace-window)

;; (set-face-attribute 'default nil
;;                     :family "Inconsolata"
;;                     :height 120
;;                     :weight 'normal
;;                     :width 'normal)


