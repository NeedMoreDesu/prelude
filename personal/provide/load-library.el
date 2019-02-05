(defun load-library (name)
  (unless (require name nil 'noerror)
    (package-install name)))

(provide 'load-library)
