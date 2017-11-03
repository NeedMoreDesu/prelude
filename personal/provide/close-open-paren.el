(defun inside-string-q ()
  "Returns non-nil if inside string, else nil.
Result depends on syntax table's string quote character."
  (interactive)
  (let ((result (nth 3 (syntax-ppss))))
    (message "%s" result)
    result))

(defun close-open-paren-right (arg)
  (interactive "p")
  (dotimes (k arg)
    (if-let ((closing (inside-string-q)))
      (insert closing)
      (let (pos closing)
        (if
          (ignore-errors (setq pos (save-excursion (backward-up-list 1 t t) (point))))
          (progn
            (setq closing (matching-paren (char-after pos)))
            (while (eq (char-before pos) ?\\)
              (insert "\\")
              (setq pos (1- pos)))
            (insert closing))
          (message "All parens matched")))))
  t)

(defun close-open-paren-left (args)
  (interactive "p")
  (dotimes (k args)
    (let (pos closing (i 1))
      (if
        (ignore-errors (setq pos (save-excursion (up-list 1) (point))))
        (progn
      (setq closing (matching-paren (char-before pos)))
      (while (eq (char-before (- pos i)) ?\\)
        (setq i (1+ i)))
      (dotimes (j (1- i)) (insert "\\")) ;;insert after to count right
      (insert closing)
          (backward-char i))
        (message "All parens matched"))))
  t)

(provide 'close-open-paren)
