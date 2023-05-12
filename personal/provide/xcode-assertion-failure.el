(defun xcode-assertion-failure-cleanup ()
  (interactive)
  (goto-char (point-min))
  (while (re-search-forward " *Assertions: Assertion Failure at [^ ]* XCTAssertEqual failed: (\"" nil t)
    (replace-match "" nil t))
  (while (re-search-forward ") is not equal to " nil t)
    (replace-match "\n\n" nil t))
  (let ((point-at-start (point)))
    (forward-sexp)
    (delete-region (point) (point-max))
    (delete-char -2)
    (goto-char point-at-start)
    (delete-char 2))
  (goto-char (point-min)))

(defun xcode-assertion-failure-compare ()
  (interactive)
  (delete-other-windows)
  (split-window-right)
  (ace-window 1)
  (goto-char (point-min))
  (search-forward "\n\n")
  (compare-windows nil))

(defun xcode-assertion-failure ()
  (interactive)
  (xcode-assertion-failure-cleanup)
  (xcode-assertion-failure-compare))

(provide 'xcode-assertion-failure)
