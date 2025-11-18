(defun hello-world ()
  (format t "Hello, World!~%"))

(defun greet (name)
  (format t "Hello, ~a!~%" name))

(hello-world)
(greet "Lisp")