(defun full-indent ()
  (interactive)
  (save-excursion
    (indent-region (point-min) (point-max))))

(provide 'full-indent)
