(defun unix-time-convert (arg)
  (format-time-string "%Y-%m-%d %H:%M:%S" (seconds-to-time arg)))

(defun unix-time (arg)
  (interactive "nUnix Time: ")
  (princ (unix-time-convert arg)))

(defun unix-time-at-point ()
  (interactive)
  (unix-time (thing-at-point 'number)))

(provide 'unix-time-converter)
