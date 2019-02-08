;;; -*- lexical-binding: t -*-
(require 'color)

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

(defun save-position-create-new-region (name bg-color)
  (list
    :name name
    :bg-color bg-color))

(defun save-position-save-current-region (arg)
  (let* ( (begin (copy-marker (point)))
          (end (copy-marker (if (use-region-p) (mark) (point))))
          (begin<end (< (marker-position begin) (marker-position end)))
          (begin-marker-overlay (make-overlay (- begin 1) begin))
          (end-marker-overlay (make-overlay end (+ end 1)))
          (begin-overlay (if begin<end begin-marker-overlay end-marker-overlay))
          (end-overlay (if begin<end end-marker-overlay begin-marker-overlay))
          (begin-overlay-change-fn (lambda (ov done &rest args)
                                     (if done
                                       (let ( (inhibit-modification-hooks t)
                                              (pos (marker-position begin)))
                                         (move-overlay ov
                                           (- pos 1)
                                           pos)))))
          (end-overlay-change-fn (lambda (ov done &rest args)
                                   (if done
                                     (let ( (inhibit-modification-hooks t)
                                            (pos (marker-position end)))
                                       (move-overlay ov
                                         pos
                                         (+ pos 1)))))) )
    (overlay-put begin-marker-overlay 'insert-in-front-hooks (list begin-overlay-change-fn))
    (overlay-put end-marker-overlay 'insert-in-front-hooks (list end-overlay-change-fn))
    (overlay-put begin-marker-overlay 'modification-hooks (list begin-overlay-change-fn))
    (overlay-put end-marker-overlay 'modification-hooks (list end-overlay-change-fn))
    (save-position-plist-merge arg
      (list
        :active (use-region-p)
        :begin begin
        :end end
        :begin-overlay begin-overlay
        :end-overlay end-overlay))))

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
  (let* ( (bright-color (plist-get arg :bg-color))
          (dim-color (color-darken-name bright-color 30))
          (begin<end (< (marker-position (plist-get arg :begin)) (marker-position (plist-get arg :end))))
          (begin-color (if begin<end bright-color dim-color))
          (end-color (if begin<end dim-color bright-color)) )
    (overlay-put (plist-get arg :begin-overlay) 'face `(:background ,begin-color))
    (overlay-put (plist-get arg :end-overlay) 'face `(:background ,end-color))))

(defun save-position-delete-region (arg)
  (if (plist-get arg :begin)
    (progn
      (delete-overlay (plist-get arg :begin-overlay))
      (delete-overlay (plist-get arg :end-overlay))
      (set-marker (plist-get arg :begin) nil)
      (set-marker (plist-get arg :end) nil)))
  (save-position-plist-merge arg
    (list
      :active nil
      :begin nil
      :end nil
      :begin-overlay nil
      :end-overlay nil)))

(defvar save-position-prev (save-position-create-new-region "p" "#88c"))
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

(defvar save-position-1 (save-position-create-new-region "1" "#c00"))
(defvar save-position-2 (save-position-create-new-region "2" "#00c")) 
(defvar save-position-3 (save-position-create-new-region "3" "#0c0"))
(defvar save-position-4 (save-position-create-new-region "4" "#c0c"))
(defvar save-position-5 (save-position-create-new-region "5" "#cc0"))
(defvar save-position-6 (save-position-create-new-region "6" "#0cc"))
(defvar save-position-7 (save-position-create-new-region "7" "#933"))
(defvar save-position-8 (save-position-create-new-region "8" "#339"))
(defvar save-position-9 (save-position-create-new-region "9" "#393"))

(provide 'save-position)
