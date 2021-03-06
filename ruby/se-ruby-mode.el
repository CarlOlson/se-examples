
(require 'se-mode)
(eval-when-compile (require 'se-macros))

(defvar se-ruby-program-name
  (concat (file-name-directory load-file-name) "se_ruby_main.rb")
  "Program to run for se-ruby mode.")

(se-create-mode "se-Ruby" ruby-mode
  "A structured editing based mode for Ruby files."
  (se-inf-start
   (or (get-buffer-process "*se-ruby-mode*") ;; reuse if existing process
       (start-process "se-ruby-mode" "*se-ruby-mode*"
   		      "irb" "--inf-ruby-mode" "-r" se-ruby-program-name))))

(se-navi-define-key 'se-ruby-mode (kbd "m") #'se-ruby-select-method)
(se-navi-define-key 'se-ruby-mode (kbd "c") #'se-ruby-select-class)
(se-navi-define-key 'se-ruby-mode (kbd "b") #'se-ruby-begin)
(se-navi-define-key 'se-ruby-mode (kbd "g") #'se-ruby-grow)

(defun se-ruby-select-method ()
  (interactive)
  (or (se-mode-select-name "def")
      (se-mode-select-name "defs")))

(defun se-ruby-select-class ()
  (interactive)
  (se-mode-select-name "class"))

(defun se-ruby-begin ()
  (interactive)
  (se-mode-select-name "begin"))

(defun se-ruby-grow ()
  (interactive)
  (or (se-mode-select-name "def")
      (se-mode-select-name "sdef")
      (se-mode-select-name "class")
      (se-mode-select-name "sclass")
      (se-mode-select-name "module")))

(provide 'se-ruby-mode)
