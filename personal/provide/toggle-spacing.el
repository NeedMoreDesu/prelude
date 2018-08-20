(defvar toggle-spacing-state 0)

(defun point-at-left-edge-of-current-whitespace ()
  (save-excursion
    (or
      (if (re-search-backward "[^\s\n]" nil t)
        (match-end 0))
      (point-min))))

(defun point-at-right-edge-of-current-whitespace ()
  (save-excursion
    (or
      (if (re-search-forward "[^\s\n]" nil t)
        (match-beginning 0))
      (point-max))))

(defun toggle-spacing (prefer-left-side &optional state)
  (interactive "P")
  (if
    (eq last-command this-command)
    (progn
      (setq toggle-spacing-state (+ toggle-spacing-state 1))
      (if (>= toggle-spacing-state 4)
        (setq toggle-spacing-state 0)))
    (setq toggle-spacing-state 0))
  (if state (setq toggle-spacing-state state))
  (just-one-space)
  (delete-region
    (point-at-left-edge-of-current-whitespace)
    (point-at-right-edge-of-current-whitespace))
  (if (= toggle-spacing-state 0)
    (just-one-space)
    (if (= toggle-spacing-state 1)
      (save-excursion (newline-and-indent))
      (if (= toggle-spacing-state 2)
        (progn
          (save-excursion (newline-and-indent))
          (save-excursion (newline-and-indent))))))
  (goto-char
    (if prefer-left-side
      (point-at-left-edge-of-current-whitespace)
      (point-at-right-edge-of-current-whitespace))))

(provide 'toggle-spacing)
