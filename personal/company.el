(require 'load-library)

(load-library 'company)
(load-library 'yasnippet)
(load-library 'company-flx)
(load-library 'company-capf)

(setq-default company-idle-delay nil)
(setq-default company-search-filtering t)
(setq-default company-tooltip-limit 999)
(setq-default company-tooltip-minimum 2)
(global-company-mode t)

(with-eval-after-load 'company
  (add-hook 'company-mode-hook (lambda ()
                                 (add-to-list 'company-backends 'company-capf)))
  (company-flx-mode +1))
