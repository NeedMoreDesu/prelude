(defvar kmacro-loop-count 0)
(defun kmacro-if-not-in-loop (orig-fun &rest args)
  (if (= kmacro-loop-count 0)
    (prog2
      (setq kmacro-loop-count (1+ kmacro-loop-count))
      (condition-case e (apply orig-fun args)
        (error
          (setq kmacro-loop-count 0)
          (error e)))
      (setq kmacro-loop-count (1- kmacro-loop-count)))
    nil))

(advice-add 'kmacro-call-macro :around #'kmacro-if-not-in-loop)
(advice-add 'kmacro-exec-ring-item :around #'kmacro-if-not-in-loop)
