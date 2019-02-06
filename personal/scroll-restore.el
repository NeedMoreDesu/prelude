(require 'load-library)

(load-library 'scroll-restore)

;; Allow scroll-restore to modify the cursor face
(setq scroll-restore-handle-cursor t)
;; Make the cursor invisible while POINT is off-screen
(setq scroll-restore-cursor-type nil)
;; Jump back to the original cursor position after scrolling
(setq scroll-restore-jump-back t)

(define-globalized-minor-mode global-scroll-restore-mode scroll-restore-mode
  (lambda () (scroll-restore-mode 1)))

(global-scroll-restore-mode 1)

;; fix bug with treating lambdas as symbolp
(defun only-symbolp-this-command (orig-fun &rest args)
  (if (symbolp this-command)
    (apply orig-fun args)))

(advice-add 'scroll-restore-pre-command :around #'only-symbolp-this-command)
(advice-add 'scroll-restore-post-command :around #'only-symbolp-this-command)


