
(require 'se-mode)
(eval-when-compile (require 'se-macros))

(defvar cl-program-name
  (concat (file-name-directory load-file-name) "cl-mode")
  "Location cl-mode script.")

(se-create-mode "CL" nil
  "Major mode for editing combinator logic files."
  (se-inf-start
   (or (get-buffer-process "*cl-mode*")
       (start-process "cl-mode" "*cl-mode*" "bash" cl-program-name)))
  (add-hook 'se-inf-response-hook #'cl-process-message nil t)
  (setq-local comment-start "--"))

(add-to-list 'auto-mode-alist (cons "\\.cl\\'" #'cl-mode))

(define-key cl-mode-map (kbd "C-c C-x") #'cl-eval-expr)
(se-navi-define-key 'cl-mode (kbd "x") #'cl-se-eval-selected)

(defun cl-process-message (json)
  (let ((msg (cdr (assoc 'message json))))
    (when msg
      (message "%s" msg))))

(defun cl-eval-expr (expr)
  "Evaluates combinatory logic expression."
  (interactive "MCL Eval: ")
  (se-inf-ask (concat "--timeout 1 --spans --eval\nprint " expr)))

(defun cl-se-eval-selected ()
  (interactive)
  (when (se-mode-selected)
    (cl-eval-expr
     (buffer-substring-no-properties (se-term-start (se-mode-selected))
				     (se-term-end (se-mode-selected))))))

(provide 'cl-mode)
