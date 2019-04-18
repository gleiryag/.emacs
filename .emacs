
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

(setq load-path (cons "/usr/local/share/mdk" load-path))
(autoload 'mixal-mode "mixal-mode" t)
(add-to-list 'auto-mode-alist '("\\.mixal\\'" . mixal-mode))



(autoload 'mixvm "mixvm" "mixvm/gud interaction" t)

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
(straight-use-package 'yaml-mode)
(straight-use-package 'flycheck-yamllint)
(straight-use-package 'indent-tools)
(straight-use-package 'hydra)
(straight-use-package 'tide)
(straight-use-package 'sml-mode)
(straight-use-package 'web-mode)

(load-theme 'doom-tomorrow-night t)
(straight-use-package 'js3-mode)
(projectile-mode +1)
(yas-global-mode 1)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map) 
(global-set-key (kbd "<backtab>") 'company-complete)
(global-set-key (kbd "C-c >") 'indent-tools-hydra/body)

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
(setq sml-program-name "/usr/lib/custom/smlnj/bin/sml")

(yas-reload-all)

(add-hook 'prog-mode-hook 'yas-minor-mode)
(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'after-init-hook #'global-flycheck-mode)

(setq initial-buffer-choice 'eshell)
