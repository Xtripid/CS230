;; Jason Wang jsw50
;; SA7

(require racket/base)

(define deep-reverse
  (lambda ((l <list>))
    (cond
      ((null? l) '())
      (else
       (if (list? (car l))
           (append (deep-reverse (cdr l)) (list (deep-reverse (car l))))
           (append (deep-reverse (cdr l)) (list (car l))))))))

;; (deep-reverse '())
;; ()

;; (deep-reverse '(1 (2 3) 4 5))
;; (5 4 (3 2) 1)

;; (deep-reverse '(1 (2 3) (4 (5 6) 7) (8 9 (10 11 (12)))))
;; ((((12) 11 10) 9 8) (7 (6 5) 4) (3 2) 1)


;; For this, the order of growth depends on the deepest that lists are within lists.
;; Therefore, the order of growth is O(N^x) where x is the deepest level of lists.
;; If there is only 2 levels of lists, like '((1 2) (3 4) (5 6) (7 8)), then it takes O(N^2) time
;; as it would through the first level of lists and then the second level of lists for each first
;; level of lists, similar to a nested for loop.