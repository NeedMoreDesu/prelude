(require 'json-pretty-print)

(defvar paste-into-temp-buffer-prefix "temp-buffer-")
(defvar paste-into-temp-buffer-count 1)
(defvar paste-into-temp-buffer-invocation-count 0)

(defun paste-into-temp-buffer()
  "Used to learn keys or key-combinations in some mode. Just passes every key combination to `describe-key-briefly'. Quit with C-g or ESC ESC ESC"
  (interactive)
  (if (not (equal last-command this-command))
    (setq paste-into-temp-buffer-invocation-count 0))
  (cond
    ((= paste-into-temp-buffer-invocation-count 0)
      (switch-to-buffer (concat paste-into-temp-buffer-prefix (int-to-string paste-into-temp-buffer-count)))
      (setq paste-into-temp-buffer-count (+ 1 paste-into-temp-buffer-count))
      (message "Use this command again to paste"))
    ((= paste-into-temp-buffer-invocation-count 1)
      (yank)
      (setq this-command 'paste-into-temp-buffer)
      (message "Use this command again to pretty format json"))
    ((= paste-into-temp-buffer-invocation-count 2)
      (json-pretty-print-buffer)
      (setq paste-into-temp-buffer-invocation-count 0)))
  (setq paste-into-temp-buffer-invocation-count (+ paste-into-temp-buffer-invocation-count 1)))

(provide 'paste-into-temp-buffer)
