(require 'load-library)

(load-library 'lsp-mode)
(load-library 'lsp-ui)

(add-hook 'dart-mode-hook 'lsp)

(setq-default
  lsp-ui-sideline-enable t
  lsp-ui-sideline-show-diagnostics t
  lsp-ui-sideline-show-code-actions nil)
