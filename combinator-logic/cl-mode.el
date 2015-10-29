
(require 'se-mode)

(defvar cl-program-name
  (concat (file-name-directory load-file-name) "cl-mode.sh")
  "Location cl-mode.sh script.")

;; keep emacs version <24 compatability
(defalias 'cl-parent-mode
  (if (fboundp 'prog-mode) 'prog-mode 'fundamental-mode))

(define-derived-mode cl-mode cl-parent-mode
  "CL"
  "Major mode for editing combinator logic files."

  (setq-local comment-start "--")
  
  (se-mode)
  (se-inf-start
   (or (get-buffer-process "*cl-mode*")
       (start-process "cl-mode" "*cl-mode*" "sh" cl-program-name)))
  (add-hook 'se-navigation-mode-hook #'cl-parse-file nil t)
  (add-hook 'se-inf-response-hook #'cl-process-message nil t))

(define-key cl-mode-map (kbd "C-c C-x") #'cl-eval-expr)
(se-navi-define-key 'cl-mode (kbd "x") #'cl-se-eval-selected)

(add-to-list 'auto-mode-alist (cons "\\.cl\\'" #'cl-mode))

(defun cl-parse-file ()
  "Only parse when navigation mode is active. This prevents the
navigation mode hook from calling `se-inf-parse-file' when
deactivating."
  (when se-navigation-mode
    (se-inf-parse-file)))

(defun cl-process-message (JSON)
  (let ((msg (cdr (assoc 'message json))))
    (when msg
      (message "%s" msg))))

(defun cl-eval-expr (EXPR)
  "Evaluates combinatory logic expression."
  (interactive "MCL Eval: ")
  (se-inf-ask (concat "--eval 'print " EXPR "' --timeout 1 --spans")))

(defun cl-se-eval-selected ()
  (interactive)
  (when (se-mode-selected)
    (cl-eval-expr
     (buffer-substring-no-properties (se-term-start (se-mode-selected))
				     (se-term-end (se-mode-selected))))))

(provide 'cl-mode)
