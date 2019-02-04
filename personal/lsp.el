(unless (require 'lsp-mode nil 'noerror)
  (package-install 'lsp-mode))

(unless (require 'lsp-ui nil 'noerror)
  (package-install 'lsp-ui))

(add-hook 'dart-mode-hook 'lsp)

(setq-default
  lsp-ui-sideline-enable t
  lsp-ui-sideline-show-diagnostics t
  lsp-ui-sideline-show-code-actions nil)
