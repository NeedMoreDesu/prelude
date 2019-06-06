(setq mac-right-command-modifier 'hyper)

(defun dired-here ()
  (interactive)
  (dired "."))
(global-set-key [H-return] 'dired-here)
(global-set-key (kbd "H-q") 'query-replace)
(global-set-key (kbd "H-r") 'replace-string)
(global-set-key (kbd "H-C-q") 'query-replace-regexp)
(global-set-key (kbd "H-C-r") 'replace-regexp)

(require 'cmnuminc)
(global-set-key [?\H-=] 'cm-calc-eval-line)
(global-set-key [?\H-\M-=] 'cm-calc-eval)
(global-set-key [?\H-+] 'cm-number-inc)
(global-set-key [?\H--] 'cm-number-dec)
(global-set-key (kbd "H-<kp-add>") 'cm-number-inc)
(global-set-key (kbd "H-<kp-subtract>") 'cm-number-dec)

(require 'insert-with-replacement)
(global-set-key (kbd "H-y") 'insert-with-replacement)

(require 'try-keys)
(global-set-key [H-f1] 'try-keys)

(require 'toggle-spacing)
(global-set-key (kbd "C-z") 'toggle-spacing)

(require 'comment-toggle)
(global-set-key (kbd "H-/") 'comment-toggle)

(require 'full-indent)
(global-set-key (kbd "H-, H-,") 'full-indent)

(require 'macos-related)
(global-set-key [M-return] 'macos-finder-here)
(global-set-key [H-M-return] 'macos-terminal-here)

(require 'company)
(require 'auto-complete)
(global-set-key [C-tab] 'company-complete)
(define-key company-active-map [C-tab] 'company-search-candidates)
(global-set-key (kbd "H-i") 'auto-complete)
(global-set-key (kbd "H-M-i") 'complete-symbol)

(require 'close-open-paren)
(global-set-key (kbd "H-[") 'close-open-paren-left)
(global-set-key (kbd "H-]") 'close-open-paren-right)

(require 'windmove)
(global-set-key (kbd "H-<left>")  'windmove-left)
(global-set-key (kbd "H-<right>") 'windmove-right)
(global-set-key (kbd "H-<up>")    'windmove-up)
(global-set-key (kbd "H-<down>")  'windmove-down)

(require 'projectile)
(global-set-key (kbd "H-, t") 'projectile-toggle-between-implementation-and-test)

(require 'open-todo)
(define-key org-mode-map (kbd "C-c <backspace>") 'org-push-task-to-done)

(require 'add-quote)
(global-set-key (kbd "H-, >") 'add-quote)
(global-set-key (kbd "H-, <") 'remove-indent-level)

;; move to custom config files quicker
(global-set-key (kbd "H-p") (lambda () (interactive) (find-file "~/.emacs.d/personal/")))

(require 'ido-preview)
(add-hook 'ido-setup-hook
  (lambda ()
    (define-key ido-completion-map (kbd "C-M-p") (lookup-key ido-completion-map (kbd "C-p")))
    (define-key ido-completion-map (kbd "C-M-n") (lookup-key ido-completion-map (kbd "C-n"))) ; currently, this makes nothing. Maybe they'll make C-n key lately.
    (define-key ido-completion-map (kbd "C-p") 'ido-preview-backward)
    (define-key ido-completion-map (kbd "C-n") 'ido-preview-forward)))

(require 'dired)
(define-key dired-mode-map (kbd "<S-return>") 'dired-maybe-insert-subdir)
(require 'crux)
(define-key global-map (kbd "<S-return>") 'crux-smart-open-line)
(define-key prelude-mode-map (kbd "<S-return>") nil)

(require 'flutter)
(require 'dart-mode)
(require 'lsp-ui-flycheck)
(defun flutter-define-key (key fn)
  (define-key dart-mode-map key fn)
  (define-key flutter-mode-map key fn)
  (define-key lsp-ui-flycheck-list-mode-map key fn))
(flutter-define-key (kbd "H-b") 'flutter-run-or-hot-reload)
(flutter-define-key (kbd "H-M-b") 'flutter-run)
(flutter-define-key (kbd "H-h") 'lsp-ui-flycheck-list)

(require 'save-position)
(save-position-define-key global-map (kbd "H-M-1") (kbd "H-1") save-position-1)
(save-position-define-key global-map (kbd "H-M-2") (kbd "H-2") save-position-2)
(save-position-define-key global-map (kbd "H-M-3") (kbd "H-3") save-position-3)
(save-position-define-key global-map (kbd "H-M-4") (kbd "H-4") save-position-4)
(save-position-define-key global-map (kbd "H-M-5") (kbd "H-5") save-position-5)
(save-position-define-key global-map (kbd "H-M-6") (kbd "H-6") save-position-6)
(save-position-define-key global-map (kbd "H-M-7") (kbd "H-7") save-position-7)
(save-position-define-key global-map (kbd "H-M-8") (kbd "H-8") save-position-8)
(save-position-define-key global-map (kbd "H-M-9") (kbd "H-9") save-position-9)
(define-key global-map (kbd "H-0") 'save-position-move-to-prev)
(define-key global-map (kbd "H-M-0") 'save-position-toggle-prev)

(require 'smex)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(global-set-key (kbd "C-<f3>") 'kmacro-bind-to-key)
(global-set-key (kbd "C-<f4>") (lookup-key global-map (kbd "C-x C-k")))

(require 'json-pretty-print)
(global-set-key (kbd "H-, j") 'json-pretty-print)
