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
(set-frame-font "Source Code Pro Medium-10")
(add-to-list 'default-frame-alist '(font . "Source Code Pro Medium-10"))

;; (set-face-font 'default "Source Code Pro Semibold-11")
(set-face-font 'default "Source Code Pro Medium-10")

;;(setq default-frame-alist '((font . "Source Code Pro-11")))
;;(setq default-frame-alist '((font . "Source Code Pro-11")))
;; (add-to-list 'default-frame-alist '(font . "Source Code Pro-11"))

;; activate visual-line-mode
(global-visual-line-mode t)

;; personal customisation Options->Customize emacs

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#212121" "#CC5542" "#6aaf50" "#7d7c61" "#5180b3" "#DC8CC3" "#9b55c3" "#bdbdb3"])
 '(custom-safe-themes
   (quote
    ("ad950f1b1bf65682e390f3547d479fd35d8c66cafa2b8aa28179d78122faa947" "12b4427ae6e0eef8b870b450e59e75122d5080016a9061c9696959e50d578057" "4f5bb895d88b6fe6a983e63429f154b8d939b4a8c581956493783b2515e22d6d" "95db78d85e3c0e735da28af774dfa59308db832f84b8a2287586f5b4f21a7a5b" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "51e228ffd6c4fff9b5168b31d5927c27734e82ec61f414970fc6bcce23bc140d" "957e495b88b9f1f48f0c20683b4394086e3a280936d81e1668bee4b763d4e2a7" "53cc2bd543176846300ab6c8f17d89832f97666e9c7991a3c403daac866db62a" "b8f08105225efce17e83d2cd62a96c0f8f55fa7b62112b7a226f125856b21409" "1db337246ebc9c083be0d728f8d20913a0f46edc0a00277746ba411c149d7fe5" "3d4a71ac5bcc8fe9178ee9bc7619e92dab7d5768b91abad64d332d79fa955c88" "e80932ca56b0f109f8545576531d3fc79487ca35a9a9693b62bf30d6d08c9aaf" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(ecb-options-version "2.40")
 '(fci-rule-color "#2e2e2e")
 '(inhibit-startup-screen t)
 '(vc-annotate-background "#3b3b3b")
 '(vc-annotate-color-map
   (quote
    ((20 . "#dd5542")
     (40 . "#CC5542")
     (60 . "#fb8512")
     (80 . "#baba36")
     (100 . "#bdbc61")
     (120 . "#7d7c61")
     (140 . "#6abd50")
     (160 . "#6aaf50")
     (180 . "#6aa350")
     (200 . "#6a9550")
     (220 . "#6a8550")
     (240 . "#6a7550")
     (260 . "#9b55c3")
     (280 . "#6CA0A3")
     (300 . "#528fd1")
     (320 . "#5180b3")
     (340 . "#6380b3")
     (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3"))
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

;; emacs ipython notebook mode
(require 'ein)    
(setq tramp-default-method "ssh")
(setq linum-format "%4d ")
;; (load-theme 'zenburn' t)
(load-theme 'ample' t)
;; set emacs window to have transparency (unfortunatelly it gets applied to whole app, not just background)
;; (set-frame-parameter (selected-frame) 'alpha '(85 85))
;; (add-to-list 'default-frame-alist '(alpha 85 85))

; hide password when doing sudo commands in eshell                                                       
(add-hook 'comint-output-filter-functions
          'comint-watch-for-password-prompt)

