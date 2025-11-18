// Typed Racket
#lang typed/racket

(: hello (-> String))
(define (hello)
  "Hello, World!")

(displayln (hello))
