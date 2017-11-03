;; This buffer is for text that is not saved, and for Lisp evaluation.
;; To create a file, visit it with C-x C-f and enter text in its buffer.

(defvar last-comment-toggle-had-region nil)
(defvar last-comment-toggle-was-comment nil)

(defun comment-toggle ()
  (interactive)
  (if (not (eq last-command this-command))
    (progn
      (setq last-comment-toggle-had-region nil)
      (setq last-comment-toggle-was-comment nil)))
  (save-excursion
    (if (or
          (region-active-p)
          last-comment-toggle-had-region)
      (progn
        (if (< (point) (mark)) (exchange-point-and-mark))
        (let ((begin (progn (exchange-point-and-mark) (point-at-bol)))
               (end (progn (exchange-point-and-mark) (point-at-eol))))
          (if last-comment-toggle-was-comment
            (uncomment-region begin end)
            (comment-region begin end))
          (setq last-comment-toggle-was-comment (not last-comment-toggle-was-comment))
          (setq last-comment-toggle-had-region t)))
      (progn
        (comment-line 1)
        (setq last-comment-toggle-had-region nil)))))

(provide 'comment-toggle)
