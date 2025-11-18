;;; Emacs Lisp example
(message "Hello, World!")

(defun greet (name)
  "Greet NAME."
  (message "Hello, %s!" name))

(greet "Emacs")