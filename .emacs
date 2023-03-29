;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;(package-initialize)

;;; Code:
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
(defvar  straight-recipe-repositories '(melpa org-elpa emacsmirror))

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
(straight-use-package 'slime)
(straight-use-package 'slime-company)
(straight-use-package 'company-web)
(straight-use-package 'ag)
(straight-use-package 'project-explorer)
(straight-use-package 'multiple-cursors)
(straight-use-package 'treemacs)
(straight-use-package 'zenburn-theme)
(straight-use-package 'elpy)
(straight-use-package 'prettier-js)
(straight-use-package 'haskell-mode)
(straight-use-package 'terraform-mode)
(straight-use-package 'terraform-doc)
(straight-use-package 'company-terraform)
(straight-use-package 'cider)
(straight-use-package 'transpose-frame)
(straight-use-package 'which-key)
(straight-use-package 'purescript-mode)
(straight-use-package 'psc-ide)
(straight-use-package 'visual-regexp-steroids)
(straight-use-package 'ample-zen-theme)

(global-set-key (kbd "C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)


(defvar inferior-lisp-program "sbcl")

(straight-use-package 'js3-mode)
(projectile-mode +1)
(yas-global-mode 1)

(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

(global-set-key (kbd "<backtab>") 'company-complete)
(global-set-key (kbd "C-c >") 'indent-tools-hydra/body)


(add-to-list 'slime-contribs 'slime-fancy)

(add-hook 'slime-load-hook
  (lambda ()
     (define-key slime-prefix-map (kbd "M-h") 'slime-documentation-lookup)))



(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
(electric-pair-mode 1)

(defvar ido-enable-flex-matching t)
(defvar ido-use-faces nil)

(defvar projectile-project-search-path '("~/CLionProjects ~/git-repos"))
(defvar eshell-scroll-to-bottom-on-output nil)
(defvar eshell-where-to-jump 'begin)
(defvar eshell-review-quick-commands nil)
(defvar eshell-smart-space-goes-to-end t)
(defvar sml-program-name "/usr/lib/custom/smlnj/bin/sml")

(yas-reload-all)

(add-hook 'prog-mode-hook 'yas-minor-mode)
(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'after-init-hook 'global-flycheck-mode)

(setq initial-buffer-choice 'eshell)

(slime-setup '(slime-fancy slime-company))

(define-key company-active-map (kbd "\C-n") 'company-select-next)
(define-key company-active-map (kbd "\C-p") 'company-select-previous)
(define-key company-active-map (kbd "\C-d") 'company-show-doc-buffer)
(define-key company-active-map (kbd "M-.") 'company-show-location)

(defvar sgml-quick-keys 'close)

(defvar dired-isearch-filenames t)

(defun my/python-mode-hook ()
  (add-to-list 'company-backends 'company-jedi))

(add-hook 'python-mode-hook 'my/python-mode-hook)

(load-theme 'ample-zen t)
(elpy-enable)

(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))

(add-to-list 'auto-mode-alist '("\\.js[x]?\\'" . web-mode))

(setq web-mode-content-types-alist
  '(("json" . "/some/path/.*\\.api\\'")
    ("xml"  . "/other/path/.*\\.api\\'")
    ("jsx"  . "/some/react/path/.*\\.js[x]?\\'")))

(setq web-mode-code-indent-offset 4)

(defun enable-minor-mode (my-pair)
  "Enable minor mode if filename match the regexp.  MY-PAIR is a cons cell (regexp . minor-mode)."
  (if (buffer-file-name)
      (if (string-match (car my-pair) buffer-file-name)
	  (funcall (cdr my-pair)))))

(add-hook 'web-mode-hook #'(lambda ()
                            (enable-minor-mode
                             '("\\.jsx?\\'" . prettier-js-mode))))
(defvar prettier-js-args '(
  "--trailing-comma" "all"
  ))

(eval-after-load 'web-mode
    '(add-hook 'web-mode-hook #'prettier-js-mode))

(eval-after-load 'flycheck '(progn
			      (flycheck-add-mode 'javascript-eslint 'web-mode)
			      ))

(add-hook 'purescript-mode-hook
	  (lambda ()
	    (psc-ide-mode)
	    (company-mode)
	    (flycheck-mode)
	    (turn-on-purescript-indentation)
	    ))

(defvar psc-ide-use-npm t)

(which-key-mode)

(setq help-echo-delay 20)

(define-key global-map (kbd "C-c r") 'vr/replace)
(define-key global-map (kbd "C-c q") 'vr/query-replace)

(define-key esc-map (kbd "C-r") 'vr/isearch-backward) ;; C-M-r
(define-key esc-map (kbd "C-s") 'vr/isearch-forward) ;; C-M-s
;;; .emacs ends here
