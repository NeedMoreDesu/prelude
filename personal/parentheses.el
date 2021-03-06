(require 'paren)
(set-face-attribute 'show-paren-match-face nil :background "gray35")
(show-paren-mode t)
(setq show-paren-style 'expression show-paren-delay 0)
(when (require 'highlight-parentheses nil 'noerror)
  (package-install 'highlight-parentheses))
(define-globalized-minor-mode global-highlight-parentheses-mode
  highlight-parentheses-mode
  (lambda ()
    (highlight-parentheses-mode t)))
(global-highlight-parentheses-mode t)
(setq hl-paren-background-colors '("green"))
(setq hl-paren-colors '("black" "red" "blue" "red3" "blue3" "red4" "blue4" "DarkOrchid1" "DarkOrchid2" "DarkOrchid3" "DarkOrchid4" "gray50" "gray50" "gray50" "gray50" "gray50" "gray50" "gray50" "gray50" "gray50" "gray50" "gray50" "gray50"))
(hl-paren-color-update)
