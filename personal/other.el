(require 'load-library)

(setq kill-ring-max 300)
(setq undo-limit 104857600) ; 100 megs
(setq undo-strong-limit 157286400) ; 150 megs
(standard-display-ascii ?\t "^I")
(setq-default subword-mode t)
(setq subword-mode t)
(if (fboundp 'subword-mode) (subword-mode t))
(line-number-mode 1)
(column-number-mode 1)
(auto-fill-mode -1)
(setq-default truncate-lines nil)
(setq-default truncate-partial-width-windows nil)
(setq-default indent-tabs-mode nil)
(setq-default tab-always-indent t)
(global-linum-mode 1)
(setq-default standard-indent 2)
(setq-default tab-width standard-indent)
(setq lisp-indent-offset standard-indent)
(setq initial-major-mode 'emacs-lisp-mode)

(require 'dired-x)
(defun dired-mouse-find-alternate-file (event)
  "In dired, visit the file or directory you click on instead of the dired buffer."
  (interactive "e")
  (let (file)
    (save-excursion
      (set-buffer (window-buffer (posn-window (event-end event))))
      (save-excursion
        (goto-char (posn-point (event-end event)))
        (setq file (dired-get-filename nil t))))
    (select-window (posn-window (event-end event)))
    (find-alternate-file (file-name-sans-versions file t))))
(define-key dired-mode-map [mouse-2] 'dired-mouse-find-alternate-file)

(require 'mrb-org-mode)
(setq org-log-done t)

(require 'git-diff-till-branch)

(setq prelude-clean-whitespace-on-save nil)

(load-library 'string-inflection)

;;; make left alt be free alt - not emacs meta key
(setq ns-alternate-modifier nil)
(setq ns-right-alternate-modifier 'meta)

(add-to-list 'auto-mode-alist '("\\.pac\\'" . javascript-mode))

(load-library 'lua-mode)
(setq-default lua-indent-level 2)

;;; maximize window for macos on emacs start
(set-frame-parameter nil 'fullscreen 'maximized)

(load-library 'reverse-im)
(reverse-im-activate '("russian-computer" "ukrainian-computer"))

(setq-default dired-dnd-protocol-alist nil)
(require 'xcode-assertion-failure)

(require 'swagger-parse)

(setq-default python-shell-interpreter "python3")
(setq-default python-shell-completion-native-enable nil)
(setq-default python-eldoc-get-doc nil)
