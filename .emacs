(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(show-paren-mode t)
 '(tool-bar-mode nil))
					;disable backup
(setq backup-inhibited t)
					;disable auto save
(setq auto-save-default nil)

;; auto pair
(setq skeleton-pair t)
(global-set-key "(" 'skeleton-pair-insert-maybe)
(global-set-key "[" 'skeleton-pair-insert-maybe)
(global-set-key "{" 'skeleton-pair-insert-maybe)
(global-set-key "'" 'skeleton-pair-insert-maybe)
(global-set-key (kbd "C-c s s") 'cscope-find-this-symbol)
(global-set-key (kbd "C-c c") 'compile)
(global-set-key (kbd "M-p") 'previous-error)
(global-set-key (kbd "M-n") 'next-error)

(define-key global-map (kbd "RET") 'newline-and-indent)
(if (null (assoc "\\.ipp\\'" auto-mode-alist))
    (setq auto-mode-alist
          (cons '("\\.ipp\\'" . c++-mode) auto-mode-alist)))

(require 'xcscope)

;; (add-hook 'python-mode-hook 'my-python-hook)

;; (defun my-python-hook ()
;;     (define-key python-mode-map (kbd "RET") 'newline-and-indent))

;; (defun my-python-mode-hook ()
;;     (cscoe-minor-mode 1))
;; (add-hook 'python-mode-hook 'my-python-mode-hook) 

;; (setq cscope-minor-mode nil)

;; (global-cscope-minor-mode 1)

;; yasnippet
;; (add-to-list 'load-path
;;               "~/.emacs.d/plugins/yasnippet")
;; (require 'yasnippet)
;; (yas-global-mode 1)

;; (load-file "~/emacs/cedet-bzr/cedet-devel-load.el")
;; (load-file "~/cedet-1.1/common/cedet.el")
;; (global-ede-mode 1)                      ; Enable the Project management system
;; (semantic-load-enable-code-helpers)      ; Enable prototype help and smart completion 
;; (global-srecode-minor-mode 1)            ; Enable template insertion menu
