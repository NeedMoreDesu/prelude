(load-library 'ido)
(setq ido-use-filename-at-point nil)
(setq ido-auto-merge-delay-time 99999)
(ido-mode t)

(load-library 'smex)

(load-library 'ido-at-point)
(setq-default ido-enable-flex-matching t)
(ido-at-point-mode t)
