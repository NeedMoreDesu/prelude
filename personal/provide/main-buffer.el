(defvar main-buffer (current-buffer))
(defvar secondary-buffer (current-buffer))

(defun set-main-buffer (arg)
  "With ARG, set secondary buffer"
  (interactive "P")
  (if arg
    (progn
      (setq secondary-buffer (current-buffer))
      (message (concat "Secondary buffer is set to " (buffer-name (current-buffer)))))
    (progn
      (setq main-buffer (current-buffer))
      (message (concat "Main buffer is set to " (buffer-name (current-buffer)))))))

(defun switch-to-main-buffer (arg)
  "With ARG, show two buffers"
  (interactive "P")
  (switch-to-buffer main-buffer)
  (delete-other-windows)
  (if arg
    (progn
      (split-window-right)
      (show-buffer (window-right (get-buffer-window)) secondary-buffer))))

(provide 'main-buffer)
