(defmacro kill-with-fire (&rest worthless-modes)
  (if worthless-modes
    `(progn (advice-add #',(car worthless-modes) :before-until (lambda (&rest args) t))
       (kill-with-fire ,@(cdr worthless-modes)))))

;; Not smart. Buggy as hell. Don't allow me to delete parens.
(kill-with-fire smartparens-mode smartparens-strict-mode)
;; Plz shutup I know what I'm doing.
(kill-with-fire guru-mode guru-global-mode)
;; Buggy, breaks buffers with ease
(kill-with-fire global-undo-tree-mode undo-tree-mode)
;; Plz no, I want my arrow navigation
(kill-with-fire windmove-default-keybindings)
