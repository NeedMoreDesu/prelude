(defun selection-or-line-bounds (&optional use-selection)
  (if (or use-selection (region-active-p))
    (progn
      (if (< (point) (mark)) (exchange-point-and-mark))
      (cons (mark) (point)))
    (cons (point-at-bol) (point-at-eol))))

(defun add-quote (arg)
  (interactive "MInsert prefix (default is \">\"): ")
  (let (deactivate-mark)                ; this is best part
    (save-excursion
      (let* ( (prefix (if (string-empty-p arg) ">" arg))
              (bounds (selection-or-line-bounds))
              (beg (car bounds))
              (end (cdr bounds)))
        (replace-regexp "^" prefix nil beg end)))))

(defun remove-indent-level (arg)
  (interactive "p")
  (let (deactivate-mark)                ; this is best part
    (save-excursion
      (let* ( (bounds (selection-or-line-bounds))
              (beg (car bounds))
              (end (cdr bounds)))  
        (indent-rigidly beg end (- arg))))))

(provide 'add-quote)
