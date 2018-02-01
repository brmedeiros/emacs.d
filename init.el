;; general emacs config
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (spolsky)))
 '(custom-safe-themes
   (quote
    ("fdde9aa5e96c6f4b05d1318e3cb83955e41f95bfa58bfe0c7220d923a8ba09d2" "345e1e877081d0f92ccd49d0f814154548254be876fc2cb5b2e5fd36f34b7e36" "7476454848b45aafe849355753f1b9068d5a4a5f35ca3dac1f1669afb7daba36" "2eae3b1cac91d6a25787f61581d4a4522c0c5053b07b633b3a1db6a0c94df8fb" "2c6ab3b8ee657291763c7bd2178b78eb6f877e8a18b1ab0a79c9cd5189ddf255" "66881e95c0eda61d34aa7f08ebacf03319d37fe202d68ecf6a1dbfd49d664bc3" "28ec8ccf6190f6a73812df9bc91df54ce1d6132f18b4c8fcc85d45298569eb53" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "96998f6f11ef9f551b427b8853d947a7857ea5a578c75aa9c4e7c73fe04d10b4" "c48551a5fb7b9fc019bf3f61ebf14cf7c9cdca79bcb2a4219195371c02268f11" "987b709680284a5858d5fe7e4e428463a20dfabe0a6f2a6146b3b8c7c529f08b" "e0d42a58c84161a0744ceab595370cbe290949968ab62273aed6212df0ea94b4" "3cd28471e80be3bd2657ca3f03fbb2884ab669662271794360866ab60b6cb6e6" "3cc2385c39257fed66238921602d8104d8fd6266ad88a006d0a4325336f5ee02" "e9776d12e4ccb722a2a732c6e80423331bcb93f02e089ba2a4b02e85de1cf00e" "72a81c54c97b9e5efcc3ea214382615649ebb539cb4f2fe3a46cd12af72c7607" "58c6711a3b568437bab07a30385d34aacf64156cc5137ea20e799984f4227265" "3d5ef3d7ed58c9ad321f05360ad8a6b24585b9c49abcee67bdcbb0fe583a6950" "b3775ba758e7d31f3bb849e7c9e48ff60929a792961a2d536edec8f68c671ca5" "9b59e147dbbde5e638ea1cde5ec0a358d5f269d27bd2b893a0947c4a867e14c1" default)))
 '(inhibit-startup-screen t)
 '(linum-format (quote dynamic))
 '(package-selected-packages
   (quote
    (multiple-cursors json-mode rjsx-mode yasnippet-snippets web-mode sublime-themes pyvenv js2-mode highlight-indent-guides go-mode find-file-in-project dash company auto-complete async)))
 '(show-paren-mode t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flyspell-incorrect ((t (:foreground "orange red" :underline t :weight bold))) t))

;;custom themes folder
(add-to-list 'custom-theme-load-path "~/.emacs.d/elpa/sublime-themes-20170606.1144")
(load-theme 'spolsky t)

(global-auto-revert-mode t)
;; end of general emacs config

;; window config
;; initial window
;; (setq initial-frame-alist
;;       '(
;;         (width . 130) ; character
;;         (height . 40) ; lines
;;         ))

;; ;; default/sebsequent window
;; (setq default-frame-alist
;;       '(
;;         (width . 130) ; character
;;         (height . 40) ; lines
;;         ))
;; end of window config

;; backup files folder and setup
(setq backup-directory-alist '(("." . "~/.emacs.d/backup-files"))
  backup-by-copying t    ; Don't delink hardlinks
  version-control t      ; Use version numbers on backups
  delete-old-versions t  ; Automatically delete excess backups
  kept-new-versions 5    ; how many of the newest versions to keep
  kept-old-versions 1    ; and how many of the old
  )
;; end of backup files folder and setup

;; MELPA config - load emacs 24's package system. Add MELPA repository.
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   ;;'("melpa" . "http://stable.melpa.org/packages/") ; many packages won't show if using stable
   '("melpa" . "http://melpa.milkbox.net/packages/")
   t)
  (package-initialize)
  )
;; end of MELPA config

;; remove trailing white space before saving buffer
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; auto-fill and flyspell modes config
(require 'iso-transl)
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(dolist (hook '(text-mode-hook))
      (add-hook hook (lambda () (flyspell-mode 1))))
    (dolist (hook '(change-log-mode-hook log-edit-mode-hook))
      (add-hook hook (lambda () (flyspell-mode -1))))
;; end of auto-fill and flyspell modes config

;; line wrapping setup
(setq-default truncate-lines t)
;; end of line wrapping setup

;; global auto-complete setup
(require 'auto-complete)
(require 'auto-complete-config)
(add-to-list 'ac-modes 'rjsx-mode)
(add-to-list 'ac-modes 'json-mode)
(ac-config-default)
(global-auto-complete-mode t)
;; end of global auto-complete setup

;; ;; global company-mode setup
;; (add-hook 'after-init-hook 'global-company-mode)
;; (setq company-dabbrev-downcase nil)
;; ;; end of global company-mode setup

;; ;; yasnippets setup
;; (add-to-list 'load-path
;;                 "~/.emacs.d/elpa/yasnippet-0.11.0/")
;;    (require 'yasnippet)
;;    (yas-global-mode 1)
;; ;; yasnippets setup

;; multiple cursors setup
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
;; end of multiple cursors setup

;; linum mode config for C, Python, html and web modes
(defun my-c-mode-hook ()
  (linum-mode 1))
(add-hook 'c-mode-hook 'my-c-mode-hook)

(defun my-python-mode-hook ()
  (linum-mode 1))
(add-hook 'python-mode-hook 'my-python-mode-hook)

(defun my-html-mode-hook ()
  (linum-mode 1))
(add-hook 'html-mode-hook 'my-html-mode-hook)

(defun my-web-mode-hook ()
  (linum-mode 1))
(add-hook 'web-mode-hook 'my-web-mode-hook)

(defun my-js2-mode-hook ()
  (linum-mode 1))
(add-hook 'js2-mode-hook 'my-js2-mode-hook)

(defun my-rjsx-mode-hook ()
  (linum-mode 1))
(add-hook 'rjsx-mode-hook 'my-rjsx-mode-hook)

(defun my-json-mode-hook ()
  (linum-mode 1))
(add-hook 'json-mode-hook 'my-json-mode-hook)
;; end of linum mode config

;; indent guides mode config
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
;; (setq highlight-indent-guides-method 'column)
 (setq highlight-indent-guides-method 'character)
;; (setq highlight-indent-guides-character ?\.)
;; end of indent guides mode config;

;; change git branches
(global-set-key [f5] 'revert-buffer)

;; web-mode for editing html/css
(add-to-list 'load-path "~/.emacs.d/web-mode/")
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
;; end of web-mode for editing html/css

;; ;; js2-mode for editing javascript
;; (require 'js2-mode)
;; (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; rjsx-mode for editing javascript
(require 'rjsx-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . rjsx-mode))

;; Better imenu
(add-hook 'js2-mode-hook #'js2-imenu-extras-mode)
;; end of js2-mode for editing javascript
