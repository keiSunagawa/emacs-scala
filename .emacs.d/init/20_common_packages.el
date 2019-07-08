(use-package madhat2r-theme)

(use-package undo-tree
  :config (progn
            (global-undo-tree-mode)))

(use-package helm
  :config (progn
            (require 'helm-config)
            (helm-mode 1)))
(use-package helm-descbinds
  :config
  (progn
    (helm-descbinds-mode)))

(use-package swiper)

(use-package expand-region)

(use-package elscreen
  :config (progn
            (elscreen-start)))

(use-package company
  :init (progn
          (setq company-transformers '(company-sort-by-occurrence))
          (setq company-idle-delay 0)
          (setq company-minimum-prefix-length 2)
          (setq company-selection-wrap-around t)
          (setq completion-ignore-case t)
          (setq company-dabbrev-downcase nil))
  :config (progn
            (global-company-mode)))

(use-package yasnippet
  :straight (:repo "https://github.com/joaotavora/yasnippet" :branch "master")
  :config (progn
            (yas-reload-all)
            (add-hook 'makefile-bsdmake-mode-hook #'yas-minor-mode)))

(use-package projectile
  ;; project-root find rule
  :init (progn
          (setq projectile-project-root-files-functions
                '(projectile-root-local
                  projectile-root-top-down
                  projectile-root-bottom-up
                  projectile-root-top-down-recurring)))
  :config (progn
            (projectile-global-mode)
            (setq projectile-completion-system 'helm)
            (add-to-list 'projectile-project-root-files ".projectroot")))

(use-package helm-projectile
  :config (progn
            (helm-projectile-on)))

;; projectile like root find function
(defun direx-project:vc-root-p (dirname)
  (cl-loop for vc-dir in projectile-project-root-files
           thereis (file-exists-p (expand-file-name vc-dir dirname))))
(use-package direx
  :init (progn
          (setq direx-project:project-root-predicate-functions '(direx-project:vc-root-p))))

(use-package ace-jump-mode
  :config (progn
            (setq ace-jump-mode-move-keys
                  (append "asdfghjkl;:]qwertyuiop@zxcvbnm,." nil))
            (setq ace-jump-word-mode-use-query-char nil)))

(use-package rainbow-delimiters
  :config (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

(use-package golden-ratio
  :config (progn
            (golden-ratio-mode)))
