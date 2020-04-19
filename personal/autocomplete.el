(require 'load-library)

(load-library 'auto-complete)
(load-library 'fuzzy)
(ac-config-default)
(setq ac-ignore-case nil)

(global-auto-complete-mode t)

(defun auto-complete-mode-maybe ()
  "No maybe for you. Only AC!"
  (unless (minibufferp (current-buffer))
    (auto-complete-mode 1)))

(load-library 'ac-capf)
(add-hook 'change-major-mode-after-body-hook 'ac-capf-setup)
(add-hook 'minibuffer-setup-hook (lambda ()
                                   (auto-complete-mode -1)))
