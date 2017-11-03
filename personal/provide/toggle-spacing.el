(defvar toggle-spacing-state 0)
(defun toggle-spacing ()
  (interactive)
  (if
    (eq last-command this-command)
    (progn
      (setq toggle-spacing-state (+ toggle-spacing-state 1))
      (if (>= toggle-spacing-state 4)
        (setq toggle-spacing-state 0)))
    (setq toggle-spacing-state 0))
  (just-one-space)
  (re-search-backward "[^\s\n]")
  (delete-region
    (match-end 0)
    (re-search-forward "[\s\n]+"))
  (if (= toggle-spacing-state 0)
    (just-one-space)
    (if (= toggle-spacing-state 1)
      (newline-and-indent)
      (if (= toggle-spacing-state 2)
        (progn (newline-and-indent) (newline-and-indent))))))

(provide 'toggle-spacing)
