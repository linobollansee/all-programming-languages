(display "Hello, World!")
(newline)

(define (greet name)
  (string-append "Hello, " name "!"))

(display (greet "Scheme"))
(newline)