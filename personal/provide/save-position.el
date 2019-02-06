;;; -*- lexical-binding: t -*-

(defun save-position-plist-merge (&rest plists)
  (if plists
    (let ((result (copy-sequence (car plists))))
      (while (setq plists (cdr plists))
        (let ((plist (car plists)))
          (while plist
            (setq result (plist-put result (car plist) (car (cdr plist)))
              plist (cdr (cdr plist))))))
      result)
    nil))

(defun save-position-create-new-region (name fg-color bg-color)
  (list
    :name name
    :fg-color fg-color
    :bg-color bg-color))

(defun save-position-save-current-region (arg)
  (let ( (begin (copy-marker (point)))
         (end (copy-marker (if (use-region-p) (mark) (point)))) )
    (save-position-plist-merge arg
      (list
        :active (use-region-p)
        :begin begin
        :end end
        :overlay (make-overlay begin end)))))

(defun save-position-move-to-region (arg)
  (switch-to-buffer (marker-buffer (plist-get arg :begin)))
  (if (plist-get arg :active)
    (set-mark (plist-get arg :end))
    (deactivate-mark))
  (goto-char (plist-get arg :begin))
  (recenter)
  (if (fboundp 'scroll-restore-remove)
    (scroll-restore-remove t))
  nil)

(defun save-position-apply-overlay (arg)
  (overlay-put (plist-get arg :overlay) 'before-string
    (propertize
      (concat "◤" (plist-get arg :name))
      'face `( :foreground ,(plist-get arg :fg-color)
               :background ,(plist-get arg :bg-color))))
  (overlay-put (plist-get arg :overlay) 'after-string
    (propertize
      (concat (if (plist-get arg :active) (plist-get arg :name) "") "◢")
      'face `( :foreground ,(plist-get arg :fg-color)
               :background ,(plist-get arg :bg-color)))))

(defun save-position-delete-region (arg)
  (if (plist-get arg :begin)
    (progn
      (delete-overlay (plist-get arg :overlay))
      (set-marker (plist-get arg :begin) nil)
      (set-marker (plist-get arg :end) nil)))
  (save-position-plist-merge arg
    (list
      :active nil
      :begin nil
      :end nil
      :overlay nil)))

(defvar save-position-prev (save-position-create-new-region "p" "#fff" "#000"))
(defvar save-position-prev-enabled t)
(defun save-position-store-prev ()
  (if (and save-position-prev-enabled (symbolp last-command))
    (progn
      (setq save-position-prev (save-position-delete-region save-position-prev))
      (setq save-position-prev (save-position-save-current-region save-position-prev))
      (save-position-apply-overlay save-position-prev))))

(defun save-position-move-to-prev ()
  (interactive)
  (if (plist-get save-position-prev :begin)
    (save-position-move-to-region save-position-prev)
    (princ (concat "Position " (plist-get save-position-prev :name) " is not defined"))))

(defun save-position-toggle-prev ()
  (interactive)
  (setq save-position-prev-enabled (not save-position-prev-enabled))
  (if (not save-position-prev-enabled)
    (setq save-position-prev (save-position-delete-region save-position-prev))))

(defun save-position-define-key (keymap save-key move-to-key region)
  (let ( 
         (save (lambda (arg)
                 (interactive "P")
                 (setq region (save-position-delete-region region))
                 (if (not arg)
                   (progn
                     (setq region (save-position-save-current-region region))
                     (save-position-apply-overlay region)))))
         (move-to (lambda ()
                    (interactive)
                    (if (plist-get region :begin)
                      (progn
                        (save-position-store-prev)
                        (save-position-move-to-region region))
                      (princ (concat "Position " (plist-get region :name) " is not defined"))))) )
    (define-key keymap save-key save)
    (define-key keymap move-to-key move-to)
    nil))

(defvar save-position-1 (save-position-create-new-region "1" "#000" "#f00"))
(defvar save-position-2 (save-position-create-new-region "2" "#000" "#00f"))
(defvar save-position-3 (save-position-create-new-region "3" "#000" "#0f0"))
(defvar save-position-4 (save-position-create-new-region "4" "#000" "#f0f"))
(defvar save-position-5 (save-position-create-new-region "5" "#000" "#ff0"))
(defvar save-position-6 (save-position-create-new-region "6" "#000" "#0ff"))
(defvar save-position-7 (save-position-create-new-region "7" "#000" "#f80"))
(defvar save-position-8 (save-position-create-new-region "8" "#000" "#f08"))
(defvar save-position-9 (save-position-create-new-region "9" "#000" "#08f"))

(provide 'save-position)
