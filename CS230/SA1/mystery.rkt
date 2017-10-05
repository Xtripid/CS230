(require racket/base)

(define mystery
  (lambda ((a <number>) (b <integer>))
    (cond ((zero? b) 0)
          ((odd? b)
           (+ a (mystery (+ a a) 
                         (quotient b 2))))
          (else
           (mystery (+ a a) 
                    (quotient b 2))))))