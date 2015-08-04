;;; stlc-mode.el --- Major mode for Stlc

;;; Commentary:

;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Dependency


;;; Code:

(require 'quail)

;(require 'se-mode)

(defvar stlc-version "0.1"
  "The version of the stlc mode.")

(define-minor-mode stlc-mode
  "Documentation."
  :init-value nil
  :lighter " stlc"
  :keymap (make-keymap)
  (when stlc-mode
    (se-inf-start
      (start-process "stlc-mode" "*stlc-mode*"
       "/home/astump/stlc/stlc.sh" )))
  (unless stlc-mode
    (se-inf-stop)))

(define-key stlc-mode-map (kbd "M-s") #'se-navigation-mode)

(setq auto-mode-alist (cons (cons "\\.stlc\\'" 'stlc-mode) auto-mode-alist))

(modify-coding-system-alist 'file "\\.stlc\\'" 'utf-8)

(with-temp-buffer
    (quail-define-package "Stlc" "UTF-8" "δ" t ; guidance
     "Stlc input method."
     nil nil nil nil nil nil t ; maximum-shortest
     ))

(eval `(define-derived-mode stlc-mode
  ,(if (fboundp 'prog-mode) 'prog-mode)
  "Stlc"
  "Major mode for Stlc files."

 (set-input-method "Stlc")
 (mapc (lambda (pair) (quail-defrule (car pair) (cadr pair) "Stlc"))
	'(("\\l" "λ") ("\\r" "→") ("\\h" "●") ("\\f" "⇐")))
))

(provide 'stlc-mode)
;;; stlc-mode.el ends here
