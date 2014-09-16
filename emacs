;;------添加路径--------
(add-to-list 'load-path "~/.emacs.d/plugin")
(add-to-list 'load-path "~/.emacs.d/plugin/wubi")
(add-to-list 'load-path "~/.emacs.d/plugin/google-map")
(add-to-list 'load-path "~/.emacs.d/plugin/zencoding-mode")

;;------颜色主题----------
(add-to-list 'load-path "~/.emacs.d/plugin/color-theme-6.6.0")
(require 'color-theme)
(color-theme-initialize)
(color-theme-pok-wob)

;;-------五笔-------------
(require 'wubi)
(wubi-load-local-phrases)
(register-input-method
 "chinese-wubi" "Chinese-GB" 'quail-use-package
 "WuBi" "WuBi"
 "wubi")
(if (< emacs-major-version 21)
    (setup-chinese-gb-environment)
  (set-language-environment 'Chinese-GB))
(setq default-input-method "chinese-wubi")

;;------添加注释-----------
(global-set-key [C-f3] 'comment-or-uncomment-region)

;;------谷歌地图-----------
;;(require 'google-maps)

;;-------全屏快捷键---------
(defun fullscreen ()
  (interactive)
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
			 '(2 "_NET_WM_STATE_FULLSCREEN" 0)))
(global-set-key [f11] 'fullscreen)

;;--------系统变量配置-----------
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ecb-options-version "2.40")
 '(ecb-primary-secondary-mouse-buttons (quote mouse-1--mouse-2))
 '(initial-scratch-message nil)
 '(menu-bar-mode nil)
 '(tool-bar-mode nil)
 '(scroll-bar-mode nil))
(auto-image-file-mode)
(display-time-mode 1)
(global-linum-mode t)
(iswitchb-mode 1)
(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 4)
(setq default-tab-width 4)

;;----python模式和代码补全------
(require 'yasnippet-bundle)
(setq auto-mode-alist (cons '(".py$" . python-mode) auto-mode-alist))
(setq interpreter-mode-alist (cons '("python" . python-mode) interpreter-mode-alist))
(autoload 'python-mode "python-mode" "Python editing mode." t)
(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

;;--------中文环境------------
(prefer-coding-system 'chinese-gbk)
(prefer-coding-system 'utf-8)

;;--------cedet-----------
(load-file "~/.emacs.d/plugin/cedet-1.1/common/cedet.el")
(global-ede-mode 1)
(semantic-load-enable-minimum-features)
(semantic-load-enable-code-helpers)

;;--------ecb查看代码--------
(add-to-list 'load-path  "~/.emacs.d/plugin/ecb-master")
(require 'ecb)
(setq stack-trace-on-error nil)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(setq ecb-auto-activate t)
(setq ecb-tip-of-the-day nil)

;;-------windowmove--------------------
(global-set-key [M-left] 'windmove-left)
(global-set-key [M-right] 'windmove-right)
(global-set-key [M-up] 'windmove-up)
(global-set-key [M-down] 'windmove-down)

;;------ 隐藏和显示ecb窗口---------------
(define-key global-map [(control f1)] 'ecb-hide-ecb-windows)
(define-key global-map [(control f2)] 'ecb-show-ecb-windows)

;;-------php配置--------------

;;--------php自动提示----------
(require 'install-elisp)
(setq install-elisp-repository-directory "~/.emacs.d/plugin/")
(require 'php-mode)
(add-to-list 'auto-mode-alist '("\\.php[345]?\\'\\|\\.phtml\\'" . php-mode))

(require 'auto-complete)
(locate-library "auto-complete.el") 
(add-hook 'php-mode-hook
      (lambda()
        (require 'php-completion)
        (php-completion-mode t)
        (define-key php-mode-map (kbd "C-o") 'phpcmp-complete)
        (when (require 'auto-complete nil t)
          (make-variable-buffer-local 'ac-sources)
          (add-to-list 'ac-sources 'ac-source-php-completion)
          (auto-complete-mode t)))) 

;;---------自动补全括号-------------
(defun my-c-mode-auto-pair ()  
  (interactive)  
  (make-local-variable 'skeleton-pair-alist)  
  (setq skeleton-pair-alist  '(  
    (?\" _ "\"")  
    (?\(  _ ")")  
    (?\[  _ "]")  
    (?{ \n > _ \n ?} >)))  
  (setq skeleton-pair t)  
  (local-set-key (kbd "(") 'skeleton-pair-insert-maybe)  
  (local-set-key (kbd "{") 'skeleton-pair-insert-maybe)  
  (local-set-key (kbd "\"") 'skeleton-pair-insert-maybe)  
  (local-set-key (kbd "[") 'skeleton-pair-insert-maybe))  
(add-hook 'c-mode-hook 'my-c-mode-auto-pair)  
(add-hook 'c++-mode-hook 'my-c-mode-auto-pair) 


;;---------zencoding--------------
(require 'zencoding-mode)
(add-hook 'sgml-mode-hook 'zencoding-mode) ;;Auto-start

;;---------svn----------------
;;(require 'psvn)

;;---------rainbow mode-------
;;(require 'rainbow-mode)

;;--------cscope--------------
;;(require 'xcscope)

;;--------emms-----------------
;; (add-to-list 'load-path "~/.emacs.d/plugin/emms-3.0/")
;; (require 'emms-setup)
;; (require 'emms-lyrics)
;; (require 'emms-volume)
;; (require 'emms-score)
;; (require 'emms-i18n)
;; (require 'emms-history)

;; (emms-standard)
;; (emms-default-players)
;; (setq emms-player-list '(emms-player-mplayer)
;;       emms-player-mplayer-command-name "mplayer"
;;       emms-player-mplayer-parameters '("-slave"))
;; (setq emms-repeat-playlist nil
;;       emms-source-file-default-directory "/home/lovelp/Music"
;;       emms-lyrics-dir "/home/lovelp/Music/lyrics"
;;       emms-lyrics-coding-system nil
;;       emms-playlist-buffer-name "*EMMS*")
;; (global-set-key [f4] 'emms-play-directory)
;; (global-set-key [f5] 'emms-stop)
;; (global-set-key [f6] 'emms-pause)
;; (global-set-key [f7] 'emms-previous)
;; (global-set-key [f8] 'emms-next)
;; (global-set-key [f9] 'emms-volume-lower)
;; (global-set-key [f10] 'emms-volume-raise)
