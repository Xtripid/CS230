;;; Jason Wang jsw50
;;; SA2 Part B

(require racket/base)

(define multiply
  (lambda ((a <number>) (b <integer>))
    (letrec ((iter
              (lambda (a b result)
                (cond ((zero? b) result)
                      ((odd? b)
                       (iter (+ a a) (quotient b 2) (+ result a)))
                      (else
                       (iter (+ a a) (quotient b 2) result))))))
      (iter a b 0))))