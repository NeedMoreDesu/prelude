;; This buffer is for text that is not saved, and for Lisp evaluation.
;; To create a file, visit it with C-x C-f and enter text in its buffer.

(defun whole-buffer-as-string ()
  (buffer-substring (point-min) (point-max)))

(defmacro if-command-changed-buffer (command then else)
  `(let ((buffer-old (whole-buffer-as-string)))
     ,command
     (if (not (equal buffer-old (whole-buffer-as-string)))
       ,then
       ,else)))

(defun comment-toggle (arg)
  "On ARG, comment region instead of trying to uncomment first"
  (interactive "P")
  (let (deactivate-mark) ; this is best part
    (save-excursion
      (if (or arg (region-active-p))
        (let ((mark (make-marker)))
          (set-marker mark (mark))
          (if (< (point) (mark)) (exchange-point-and-mark))
          ;; ignore being at first char of line section
          (ignore-errors (backward-char))
          (exchange-point-and-mark)
          (ignore-errors (forward-char))
          (exchange-point-and-mark)
          ;; comment whole lines section
          (let ((begin (progn (exchange-point-and-mark) (point-at-bol)))
                 (end (progn (exchange-point-and-mark) (point-at-eol))))
            ;; if can uncomment - do that
            (if arg
              (comment-region begin end)
              (if-command-changed-buffer (uncomment-region begin end)
                nil
                (comment-region begin end)))
            (setq last-comment-toggle-had-region t))
          (set-mark mark))
        (progn
          ;; it does everything we need anyways
          (comment-line 1)
          (setq last-comment-toggle-had-region nil))))))

(provide 'comment-toggle)
