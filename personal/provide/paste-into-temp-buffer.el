(defvar paste-into-temp-buffer-prefix "temp-buffer-")
(defvar paste-into-temp-buffer-count 1)

(defun paste-into-temp-buffer()
  "Used to learn keys or key-combinations in some mode. Just passes every key combination to `describe-key-briefly'. Quit with C-g or ESC ESC ESC"
  (interactive)
  (if (equal last-command this-command)
    (yank)
    (switch-to-buffer (concat paste-into-temp-buffer-prefix (int-to-string paste-into-temp-buffer-count)))
    (setq paste-into-temp-buffer-count (+ 1 paste-into-temp-buffer-count))
    (message "Use this command again to paste")
    nil))

(provide 'paste-into-temp-buffer)
