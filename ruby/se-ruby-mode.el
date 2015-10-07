
(require 'se-mode)

(defvar se-ruby-program-name
  (concat (file-name-directory load-file-name) "se_ruby_main.rb")
  "Program to run for se-ruby mode.")

(define-derived-mode se-ruby-mode ruby-mode "se-Ruby"
  "Major mode for Ruby files."
  (se-mode)
  (se-inf-start
   (or (get-buffer-process "*se-ruby-mode*") ;; reuse if existing process
       (start-process "se-ruby-mode" "*se-ruby-mode*"
		      "irb" "--inf-ruby-mode" "-r" se-ruby-program-name)))
  (add-hook 'se-navigation-mode-hook #'se-ruby-parse-file nil t))

(se-navi-define-key 'se-ruby-mode (kbd "m") #'se-ruby-select-method)
(se-navi-define-key 'se-ruby-mode (kbd "c") #'se-ruby-select-class)

(defun se-ruby-parse-file ()
  (when se-navigation-mode
    (se-inf-parse-file)))

(defun se-ruby-select-method ()
  (interactive)
  (or (se-mode-select-name "def")
      (se-mode-select-name "defs")))

(defun se-ruby-select-class ()
  (interactive)
  (se-mode-select-name "class"))

(provide 'se-ruby-mode)
