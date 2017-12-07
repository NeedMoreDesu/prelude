(require 'toggle-spacing)
(require 'org)

(defun open-todo ()
  (interactive)
  (find-file "~/Documents/TODO.org"))

(defun open-done ()
  (interactive)
  (find-file "~/Documents/DONE.org"))

(defun org-push-task-to-done ()
  (interactive)
  (goto-char (point-at-eol))
  (if (not (re-search-backward "\\*\\*" nil t))
    (message "Can't find tast at point")
    (let* ( (begin (point))
            (end (progn
                   (goto-char (point-at-eol))
                   (or
                     (if (re-search-forward "\\(\\*\\*\\)\\|\\(\n\n\\)" nil t)
                       (match-beginning 0))
                     (point-max))))
           (text (buffer-substring begin end)))
      (delete-region begin end)
      (let ((buffer (current-buffer)))
        (open-done)
        (goto-char (point-min))
        (toggle-spacing t 2)
        (insert text)
        (switch-to-buffer buffer)))))

(provide 'open-todo)
