;; CS 230 Short Assignment 4 Problem 1
;; Jason Wang jsw50

(require racket/base)

(define (second (str <sentence>))
  (if (empty? str)
      '()
      (if (empty? (cdr str))
          '()
          (first (cdr str)))))

(define true-for-all-pairs?
  (lambda ((predicate <function>) (str <sentence>))
    (letrec ((iter
             (lambda ((predicate1 <function>) (str1 <sentence>))
               (if (null? (second str1))
                   #t
                   (if (predicate1 (first str1) (second str1))
                       (iter predicate1 (cdr str1))
                       #f)))))
      (iter predicate str))))