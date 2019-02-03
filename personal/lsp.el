(unless (require 'lsp-mode nil 'noerror)
  (package-install 'lsp-mode))

(unless (require 'lsp-ui nil 'noerror)
  (package-install 'lsp-ui))

(add-hook 'dart-mode-hook 'lsp)
