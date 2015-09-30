;;; stlc-mode.el --- Major mode for Stlc

;;; Commentary:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Dependency

;;; Code:

(require 'quail)

(require 'se-mode)

(defvar stlc-version "0.1"
  "The version of the stlc mode.")

(defvar stlc-program-name "stlc"
  "Program to run for stlc mode.")

;; keep emacs version <24 compatability
(defalias 'stlc-parent-mode
  (if (fboundp 'prog-mode) 'prog-mode 'fundamental-mode))

(define-derived-mode stlc-mode stlc-parent-mode
  "Stlc"
  "Major mode for Stlc files."

  (set-input-method "Stlc")
  (quail-define-rules
   ("\\l" "λ") ("\\r" "→") ("\\h" "●") ("\\f" "⇐"))

  (setq-local comment-start "%")
  
  (se-mode)
  (se-inf-start
   (or (get-buffer-process "*stlc-mode*") ;; reuse if existing process
       (start-process "stlc-mode" "*stlc-mode*" stlc-program-name)))
  (add-hook 'se-navigation-mode-hook #'se-inf-parse-file nil t))

(add-to-list 'auto-mode-alist (cons "\\.stlc\\'" 'stlc-mode))

(modify-coding-system-alist 'file "\\.stlc\\'" 'utf-8)

(quail-define-package "Stlc" "UTF-8" "δ" t ; guidance
		      "Stlc input method."
		      nil nil nil nil nil nil t) ; maximum-shortest

(provide 'stlc-mode)
;;; stlc-mode.el ends here
