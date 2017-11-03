(defun try-keys()
  "Used to learn keys or key-combinations in some mode. Just passes every key combination to `describe-key-briefly'. Quit with C-g or ESC ESC ESC"
  (interactive)
  (let (keyseq)
    (message "Quit with C-g or ESC ESC ESC.")
    (while (not (or (equal keyseq "") (equal keyseq "")))
      (setq keyseq (read-key-sequence
                    (if keyseq
                        (describe-key-briefly keyseq)
                      "Click any key to try it: ")
                    nil
                    nil
                    nil
                    nil))
      (describe-key-briefly keyseq))))

(provide 'try-keys)
