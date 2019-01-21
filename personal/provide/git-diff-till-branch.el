(defun git-diff-till-branch (branch author)
  (interactive "sTill branch (default: master): \nsAuthor (can be blank): ")
  (shell-command
    (concat
      "git log " (if (string= "" branch) "master" branch) ".. "
      (if (string= "" author) "" (concat "--author " author))
      )))

(provide 'git-diff-till-branch)
