;; Allow automatically handing of created/expired meta data.
(require 'org-expiry)

(add-hook 'org-after-todo-state-change-hook
  (lambda ()
    (when (string= org-state "TODO")
      (save-excursion
        (org-back-to-heading)
        (org-expiry-insert-created)))))

(provide 'mrb-org-mode)
