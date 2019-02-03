(unless (require 'company nil 'noerror)
  (package-install 'company))

(unless (require 'yasnippet nil 'noerror)
  (package-install 'yasnippet))

(setq-default company-idle-delay nil)
(setq-default company-search-filtering t)
(setq-default company-tooltip-limit 999)
(setq-default company-tooltip-minimum 2)
(global-company-mode t)

(unless (require 'company-flx nil 'noerror)
  (package-install 'company-flx))

(with-eval-after-load 'company
  (add-hook 'company-mode-hook (lambda ()
                                 (add-to-list 'company-backends 'company-capf)))
  (company-flx-mode +1))
