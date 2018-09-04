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

(require 'try-keys)
(global-set-key [H-f1] 'try-keys)

(require 'toggle-spacing)
(global-set-key (kbd "C-z") 'toggle-spacing)

(require 'undo-tree)
(global-set-key (kbd "s-Z") 'undo-tree-redo)
(global-set-key (kbd "H-z") 'undo-tree-visualize)

(require 'comment-toggle)
(global-set-key (kbd "H-/") 'comment-toggle)

(require 'full-indent)
(global-set-key (kbd "H-,") 'full-indent)

(require 'macos-related)
(global-set-key [M-return] 'macos-finder-here)
(global-set-key [H-M-return] 'macos-terminal-here)

(require 'company)
(global-set-key (kbd "H-i") 'company-complete)
(define-key company-active-map (kbd "H-i") 'company-search-candidates)

(require 'close-open-paren)
(global-set-key (kbd "H-[") 'close-open-paren-left)
(global-set-key (kbd "H-]") 'close-open-paren-right)

(require 'windmove)
(global-set-key (kbd "H-<left>")  'windmove-left)
(global-set-key (kbd "H-<right>") 'windmove-right)
(global-set-key (kbd "H-<up>")    'windmove-up)
(global-set-key (kbd "H-<down>")  'windmove-down)

(require 'main-buffer)
(global-set-key (kbd "H-.") 'switch-to-main-buffer)
(global-set-key (kbd "H-M-.") 'set-main-buffer)

(require 'projectile)
(global-set-key (kbd "H-t") 'projectile-toggle-between-implementation-and-test)

(require 'open-todo)
(global-set-key (kbd "H-0") 'open-todo)
(global-set-key (kbd "H-9") 'open-done)
(define-key org-mode-map (kbd "C-c <backspace>") 'org-push-task-to-done)

(require 'add-quote)
(global-set-key (kbd "H->") 'add-quote)
(global-set-key (kbd "H-<") 'remove-indent-level)

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
