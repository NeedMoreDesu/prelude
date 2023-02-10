(defun swagger-parse ()
  (interactive)
  (save-excursion (replace-regexp "^\\([ 	]*\\)\\(\\w+\\)[ 	]*string" "\\1var \\2: String?"))
  (save-excursion (replace-regexp "^\\([ 	]*\\)\\(\\w+\\)[ 	]*int[^\n]*$" "\\1var \\2: Int?"))
  (save-excursion (replace-regexp "^\\([ 	]*\\)\\(\\w+\\)[ 	]*boolean" "\\1var \\2: Bool?"))
  (save-excursion (replace-regexp "^\\([ 	]*\\)\\(\\w+\\)[ 	]*\\[...\\]$" "//\\1var \\2: [...]?"))
  (save-excursion (replace-regexp "^\\([ 	]*\\)\\(\\w+\\)[ 	]*{...}$" "//\\1var \\2: {...}?")))

(provide 'swagger-parse)
