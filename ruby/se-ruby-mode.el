
(require 'se-mode)

(defvar se-ruby-program-name
  (concat (file-name-directory load-file-name) "se_ruby_main.rb")
  "Program to run for se-ruby mode.")

(define-derived-mode se-ruby-mode ruby-mode
  "se-Ruby" "Major mode for Ruby files."
  
  (se-mode)
  (se-inf-start
   (or (get-buffer-process "*se-ruby-mode*") ;; reuse if existing process
       (start-process "se-ruby-mode" "*se-ruby-mode*"
		      "irb" "--inf-ruby-mode" "-r" se-ruby-program-name)))
  (add-hook 'se-navigation-mode-hook #'se-ruby-parse-file nil t))

(defun se-ruby-parse-file ()
  (when se-navigation-mode
    (se-inf-parse-file)))

(provide 'se-ruby-mode)
