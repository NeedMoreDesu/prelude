(require 'paren)

(show-paren-mode t)
(setq show-paren-style 'expression show-paren-delay 0)
(load-library 'highlight-parentheses)
(define-globalized-minor-mode global-highlight-parentheses-mode
  highlight-parentheses-mode
  (lambda ()
    (highlight-parentheses-mode t)))
(global-highlight-parentheses-mode t)
(setq highlight-parentheses-colors '("green"))
(setq highlight-parentheses-background-colors '("black" "red" "blue" "red3" "blue3" "red4" "blue4" "DarkOrchid1" "DarkOrchid2" "DarkOrchid3" "DarkOrchid4" "gray50" "gray50" "gray50" "gray50" "gray50" "gray50" "gray50" "gray50" "gray50" "gray50" "gray50" "gray50"))

