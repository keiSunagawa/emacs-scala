(setq make-backup-files nil)
(setq auto-save-default nil)

(setq truncate-lines (not em-scala/wrap-longlines))
(setq truncate-partial-width-windows (not em-scala/wrap-longlines))

;; enable *case-region function
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(setq-default indent-tabs-mode nil)

(electric-pair-mode 1)
(setq show-paren-delay 0)
(show-paren-mode t)

(global-auto-revert-mode t)

;; functions
(defun dabbrev-completion ()
  (interactive)
  (company-begin-backend 'company-dabbrev))

(global-whitespace-mode t)
(defun delete-wspace()
  (delete-trailing-whitespace))
(add-hook 'before-save-hook' delete-wspace)
(setq whitespace-display-mappings
      '(
        (space-mark   ?\xA0  [?_])
        (newline-mark ?\n    [?$ ?\n])
        (tab-mark     ?\t    [?\\ ?\t])))
(setq whitespace-line-column 250)

(set-keyboard-coding-system 'utf-8-emacs-mac)
