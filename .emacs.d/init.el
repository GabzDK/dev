(setq custom-file "~/.emacs.d/emacs.custom.el")

(package-initialize)

(load "~/.emacs.d/day-emacs/day.el")
(load "~/.emacs.d/day-emacs/preferences.el")
(load "~/.emacs.d/day-emacs/scripts.el")

;;; interface section
(require 'ansi-color)

(day/require-theme 'gruber-darker)

;;; generic keybinds
(global-set-key (kbd "C-x C-g") 'find-file-at-point)
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(global-set-key (kbd "C-,") 'day/duplicate-line)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
(global-set-key (kbd "C-x p s") 'day/rgrep-selected)
(global-set-key (kbd "C-x C-p") 'previous-buffer)
(global-set-key (kbd "C-x C-n") 'next-buffer)
(global-set-key (kbd "C-x C-q") 'kill-current-buffer)

(day/require 'all-the-icons)

;;; ido
(day/require 'smex 'ido-completing-read+)

(require 'ido-completing-read+)

(ido-mode 1)
(ido-everywhere 1)
(ido-ubiquitous-mode 1)

;;; Paredit
(day/require 'paredit)

(defun day/turn-on-paredit ()
  (interactive)
  (paredit-mode 1))

(add-hook 'emacs-lisp-mode-hook  'day/turn-on-paredit)
(add-hook 'clojure-mode-hook     'day/turn-on-paredit)
(add-hook 'lisp-mode-hook        'day/turn-on-paredit)
(add-hook 'common-lisp-mode-hook 'day/turn-on-paredit)
(add-hook 'scheme-mode-hook      'day/turn-on-paredit)
(add-hook 'racket-mode-hook      'day/turn-on-paredit)

;;; Emacs lisp
(add-hook 'emacs-lisp-mode-hook
          '(lambda ()
             (local-set-key (kbd "C-c C-j")
                            (quote eval-print-last-sexp))))
(add-to-list 'auto-mode-alist '("Cask" . emacs-lisp-mode))

;;; diredx
(require 'dired-x)
(setq-default dired-dwim-target t)
(setq dired-listing-switches "-alh")
(setq dired-mouse-drag-files t)

(day/require 'which-key)
(which-key-mode)
(setq which-key-idle-delay 0.5)

;;; multiple cursors
(day/require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->")         'mc/mark-next-like-this)
(global-set-key (kbd "C-<")         'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<")     'mc/mark-all-like-this)
(global-set-key (kbd "C-\"")        'mc/skip-to-next-like-this)
(global-set-key (kbd "C-:")         'mc/skip-to-previous-like-this)
;;; helm
(day/require 'helm 'helm-git-grep 'helm-ls-git 'helm-lsp)

(setq helm-ff-transformer-show-only-basename nil)
 
(global-set-key (kbd "C-c h t") 'helm-cmd-t)
(global-set-key (kbd "C-c h g g") 'helm-git-grep)
(global-set-key (kbd "C-c h g l") 'helm-ls-git-ls)
(global-set-key (kbd "C-c f f") 'helm-find)
(global-set-key (kbd "C-c h a") 'helm-org-agenda-files-headings)
(global-set-key (kbd "C-c h r") 'helm-recentf)
(define-key lsp-mode-map [remap xref-find-apropos] #'helm-lsp-workspace-symbol)

(day/require 'lsp-mode)
;; if you want to change prefix for lsp-mode keybindings.
(setq lsp-keymap-prefix "s-l")

(day/require 'magit)

(setq magit-auto-revert-mode nil)

(global-set-key (kbd "C-c m s") 'magit-status)
(global-set-key (kbd "C-c m l") 'magit-log)
(setq magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1)

;; TypeScript LSP setup with better autocompletion
(day/require 'lsp-mode 'lsp-ui 'company 'yasnippet)

(company-mode)

;; LSP configuration
(setq lsp-keymap-prefix "C-c l")
(setq lsp-typescript-preferences '((importModuleSpecifierPreference . "relative")))
(setq lsp-typescript-suggest-complete-function-calls t)
(setq lsp-completion-provider :capf)
(setq lsp-idle-delay 0.1)
(setq lsp-enable-symbol-highlighting t)
(setq lsp-enable-indentation t)
(setq lsp-headerline-breadcrumb-enable t)

(setq lsp-typescript-implementationsCodeLens-enabled t)
(setq lsp-typescript-references-code-lens-enabled t)
(setq lsp-typescript-surveys-enabled nil)

;; Company mode improvements
(setq company-minimum-prefix-length 1)
(setq company-idle-delay 0.0)
(setq company-tooltip-align-annotations t)
(setq company-tooltip-limit 20)
(setq company-show-numbers t)
(setq company-transformers '(company-sort-by-occurrence))
(setq company-backends '(company-capf))

;; Hook everything up
(defun my/typescript-setup ()
  (setq-local company-backends '(company-capf))
  (company-mode 1)
  (yas-minor-mode 1)
  (lsp-deferred))

;; Apply to TypeScript/JavaScript files
(add-hook 'typescript-mode-hook #'my/typescript-setup)
(add-hook 'js2-mode-hook #'my/typescript-setup)

;; For JSX/TSX in web-mode
(add-hook 'web-mode-hook
          (lambda ()
            (when (or (string-equal "tsx" (file-name-extension buffer-file-name))
                      (string-equal "jsx" (file-name-extension buffer-file-name)))
              (my/typescript-setup))))

;; Use typescript-mode for .ts files
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))

;; Format on save
(add-hook 'typescript-mode-hook
          (lambda ()
            (add-hook 'before-save-hook #'lsp-format-buffer nil t)))

(add-hook 'lsp-mode-hook
  (lambda()
    (setq lsp-headerline-breadcrumb-enable nil)))

;; Add node_modules/.bin to exec-path for project-local binaries
(defun my/add-node-modules-bin-to-path ()
  (let ((node-modules-bin (locate-dominating-file default-directory "node_modules/.bin")))
    (when node-modules-bin
      (let ((path (concat node-modules-bin "node_modules/.bin")))
        (setenv "PATH" (concat path path-separator (getenv "PATH")))
        (add-to-list 'exec-path path)))))

(add-hook 'typescript-mode-hook #'my/add-node-modules-bin-to-path)

(load-file custom-file)
