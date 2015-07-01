(require 'xcscope)
(require 'flymake)
(setq backup-inhibited t)
(show-paren-mode t)
(setq show-trailing-whitespace t)
(electric-pair-mode t)
(define-key global-map (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C-c s") 'cscope-find-this-symbol)
(global-set-key (kbd "C-c c") 'compile)
(global-set-key (kbd "C-c p") 'previous-error)
(global-set-key (kbd "C-c n") 'next-error)
(global-set-key (kbd "C-c ,") 'flymake-goto-prev-error)
(global-set-key (kbd "C-c .") 'flymake-goto-next-error)
(add-hook 'find-file-hook 'flymake-find-file-hook)
(when (load "flymake" t)
  (defun flymake-pylint-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
		       'flymake-create-temp-inplace))
	   (local-file (file-relative-name
			temp-file
			(file-name-directory buffer-file-name))))
      (list "epylint" (list local-file))))
  (add-to-list 'flymake-allowed-file-name-masks
	       '("\\.py\\'" flymake-pylint-init)))
(defun show-fly-err-at-point ()
  "If the cursor is sitting on a flymake error, display the message in the minibuffer"
  (require 'cl)
  (interactive)
  (let ((line-no (line-number-at-pos)))
    (dolist (elem flymake-err-info)
      (if (eq (car elem) line-no)
	  (let ((err (car (second elem))))
	    (message "%s" (flymake-ler-text err)))))))
(add-hook 'post-command-hook 'show-fly-err-at-point)

;; (if (null (assoc "\\.ipp\\'" auto-mode-alist))
;;     (setq auto-mode-alist
;;           (cons '("\\.ipp\\'" . c++-mode) auto-mode-alist)))
