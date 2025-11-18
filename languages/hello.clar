// Clarity (Bitcoin smart contract)
(define-public (say-hello)
  (ok "Hello, World!"))

(define-read-only (greet (name (string-ascii 50)))
  (ok (concat "Hello, " name "!")))
