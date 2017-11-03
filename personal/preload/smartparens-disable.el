(advice-add #'smartparens-mode :before-until (lambda (&rest args) t))
(advice-add #'smartparens-strict-mode :before-until (lambda (&rest args) t))
