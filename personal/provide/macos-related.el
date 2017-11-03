;;; MACOS
(defun macos-terminal-here ()
  (interactive)
  (shell-command "open -a Terminal ."))

(defun macos-finder-here ()
  (interactive)
  (shell-command "open ."))

(provide 'macos-related)
