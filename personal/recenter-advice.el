(defadvice isearch-repeat-forward (after isearch-repeat-forward-recenter activate) (recenter))
(defadvice isearch-repeat-backward (after isearch-repeat-backward-recenter activate) (recenter))
