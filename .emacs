
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;(package-initialize)

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
(load bootstrap-file nil 'nomessage))
(setq straight-recipe-repositories '(melpa org-elpa gnu-elpa emacsmirror))

(straight-use-package 'doom-themes)
(straight-use-package 'projectile)
(straight-use-package 'eshell-fixed-prompt)
(straight-use-package 'flx)
(straight-use-package 'flx-ido)
(straight-use-package 'company)
(straight-use-package 'yasnippet)
(straight-use-package 'yasnippet-snippets)
(straight-use-package 'clojure-mode)
(straight-use-package 'flycheck)
(straight-use-package 'cider)


(load-theme 'doom-tomorrow-night t)

(projectile-mode +1)
(yas-global-mode 1)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map) 
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map) 
(global-set-key (kbd "<backtab>") 'company-complete)

(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
(electric-pair-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)

(setq projectile-project-search-path '("~/projects/"))
(setq eshell-scroll-to-bottom-on-output nil)
(setq eshell-where-to-jump 'begin)
(setq eshell-review-quick-commands nil)
(setq eshell-smart-space-goes-to-end t)

(yas-reload-all)

(add-hook 'prog-mode-hook 'yas-minor-mode)
(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'after-init-hook #'global-flycheck-mode)

(setq initial-buffer-choice 'eshell)
