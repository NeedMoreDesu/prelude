(defun load-library (name)
  (unless (require name nil 'noerror)
    (unless (ignore-errors (package-install name))
      (package-refresh-contents)
      (package-install name))))

(provide 'load-library)
