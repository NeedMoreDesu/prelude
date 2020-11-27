(require 'load-library)

(setq mac-right-command-modifier 'hyper)

(defun dired-here ()
  (interactive)
  (dired "."))
(global-set-key [H-return] 'dired-here)
(global-set-key (kbd "H-q") 'query-replace)
(global-set-key (kbd "H-r") 'replace-string)
(global-set-key (kbd "H-C-q") 'query-replace-regexp)
(global-set-key (kbd "H-C-r") 'replace-regexp)

(load-library 'cmnuminc)
(global-set-key [?\H-=] 'cm-calc-eval-line)
(global-set-key [?\H-\M-=] 'cm-calc-eval)
(global-set-key [?\H-+] 'cm-number-inc)
(global-set-key [?\H--] 'cm-number-dec)
(global-set-key (kbd "H-<kp-add>") 'cm-number-inc)
(global-set-key (kbd "H-<kp-subtract>") 'cm-number-dec)

(load-library 'insert-with-replacement)
(global-set-key (kbd "H-y") 'insert-with-replacement)

(load-library 'try-keys)
(global-set-key [H-f1] 'try-keys)

(load-library 'toggle-spacing)
(global-set-key (kbd "C-z") 'toggle-spacing)

(load-library 'comment-toggle)
(global-set-key (kbd "H-/") 'comment-toggle)

(load-library 'full-indent)
(global-set-key (kbd "H-, H-,") 'full-indent)

(load-library 'macos-related)
(global-set-key [M-return] 'macos-finder-here)
(global-set-key [H-M-return] 'macos-terminal-here)

(load-library 'company)
(load-library 'auto-complete)
(load-library 'fuzzy)
(global-set-key [C-tab] 'company-complete)
(define-key company-active-map [C-tab] 'company-search-candidates)
(global-set-key (kbd "H-i") 'auto-complete)
(global-set-key (kbd "H-M-i") 'complete-symbol)

(load-library 'close-open-paren)
(global-set-key (kbd "H-[") 'close-open-paren-left)
(global-set-key (kbd "H-]") 'close-open-paren-right)

(load-library 'windmove)
(global-set-key (kbd "H-<left>")  'windmove-left)
(global-set-key (kbd "H-<right>") 'windmove-right)
(global-set-key (kbd "H-<up>")    'windmove-up)
(global-set-key (kbd "H-<down>")  'windmove-down)

(load-library 'projectile)
(global-set-key (kbd "H-, t") 'projectile-toggle-between-implementation-and-test)

(load-library 'open-todo)
(define-key org-mode-map (kbd "C-c <backspace>") 'org-push-task-to-done)

(load-library 'add-quote)
(global-set-key (kbd "H-, >") 'add-quote)
(global-set-key (kbd "H-, <") 'remove-indent-level)

;; move to custom config files quicker
(global-set-key (kbd "H-p") (lambda () (interactive) (find-file "~/.emacs.d/personal/")))

(load-library 'ido-preview)
(add-hook 'ido-setup-hook
  (lambda ()
    (define-key ido-completion-map (kbd "C-M-p") (lookup-key ido-completion-map (kbd "C-p")))
    (define-key ido-completion-map (kbd "C-M-n") (lookup-key ido-completion-map (kbd "C-n"))) ; currently, this makes nothing. Maybe they'll make C-n key lately.
    (define-key ido-completion-map (kbd "C-p") 'ido-preview-backward)
    (define-key ido-completion-map (kbd "C-n") 'ido-preview-forward)))

(load-library 'dired)
(define-key dired-mode-map (kbd "<S-return>") 'dired-maybe-insert-subdir)
(load-library 'crux)
(define-key global-map (kbd "<S-return>") 'crux-smart-open-line)
(define-key prelude-mode-map (kbd "<S-return>") nil)

(load-library 'flutter)
(load-library 'dart-mode)
(defun flutter-define-key (key fn)
  (define-key dart-mode-map key fn)
  (define-key flutter-mode-map key fn))
(flutter-define-key (kbd "H-b") 'flutter-run-or-hot-reload)
(flutter-define-key (kbd "H-M-b") 'flutter-run)

(load-library 'save-position)
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

(load-library 'smex)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(global-set-key (kbd "C-<f3>") 'kmacro-bind-to-key)
(global-set-key (kbd "C-<f4>") (lookup-key global-map (kbd "C-x C-k")))
(global-set-key (kbd "H-, m m") 'kmacro-end-or-call-macro)
(global-set-key (kbd "H-, m s") 'kmacro-start-macro-or-insert-counter)
(global-set-key (kbd "H-, m k") (lookup-key global-map (kbd "C-x C-k")))

(load-library 'json-pretty-print)
(global-set-key (kbd "H-, j") 'json-pretty-print)
(global-set-key (kbd "H-, H-j") 'json-pretty-print-buffer)

(load-library 'ag)
(global-set-key (kbd "H-, s") 'ag)
(global-set-key (kbd "H-, S") 'rgrep)

(load-library 'lua-mode)
(define-key lua-mode-map (kbd "C-c C-e") (lambda () (interactive) (call-process-shell-command "/Applications/love.app/Contents/MacOS/love ." nil 0)))

;; don't quit me.
(global-unset-key (kbd "s-q"))

(load-library 'paste-into-temp-buffer)
(global-set-key (kbd "H-b") 'paste-into-temp-buffer)
