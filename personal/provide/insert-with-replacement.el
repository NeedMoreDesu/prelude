(defvar insert-with-replacement-template "")

(defun insert-with-replacement-set-template (text)
  (interactive "sText to insert, with #1# #2# #3# etc. to be replaced: ")
  (setq insert-with-replacement-template text))

(defun insert-with-replacement (&rest replacements)
  (interactive (insert-with-replacement-read))
  (insert (insert-with-replacement-replace-internal 1 insert-with-replacement-template replacements)))

(defun insert-with-replacement-read ()
  (reverse (insert-with-replacement-read-internal 1 '())))

(defun insert-with-replacement-read-internal (count list)
  (let ((str (read-string (concat "Insert argument " (int-to-string count) " (leave empty to finish): "))))
    (if (equal str "")
      list
      (insert-with-replacement-read-internal (1+ count) (cons str list)))))

(defun insert-with-replacement-replace-internal (count string replacements)
  (let ( (replacement (car replacements))
         (tag (concat "#" (int-to-string count) "#")))
    (let ((new-string (replace-regexp-in-string tag replacement string)))
      (if (cdr replacements)
        (insert-with-replacement-replace-internal (1+ count) new-string (cdr replacements))
        new-string))))

(provide 'insert-with-replacement)
