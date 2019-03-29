(defun insert-with-replacement (text replacement)
  (interactive "sText to insert, with ### to be replaced: \nsReplacement: ")
  (insert (replace-regexp-in-string "###" replacement text)))

(provide 'insert-with-replacement)
