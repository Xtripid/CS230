;;; Jason Wang jsw50
;;; SA6 RESUBMIT

(require racket/base)

(define reverse
  (lambda ((l <list>))
    (cond
      ((null? l) '())
      (else
       (append (reverse (cdr l)) (list (first l)))))))

(define tail-reverse
  (lambda ((l <list>))
    (cond
      ((null? l) '())
      (else
       (letrec ((iter
                 (lambda ((l <list>) (l2 <list>))
                   (if (null? l)
                       l2
                       (iter (cdr l) (cons (first l) l2))))))
         (iter l '()))))))


;; For the first, not tail-recursive function, the order of growth would be O(n^2)
;; on average as every append call is called n times until there is nothing left in the list
;; and then you have to work back upwards n times to execute each recursive call
;; so therefore it would be O(n)*O(n) which is O(n^2).


;; For the second, tail-recursive function, the order of growth would be O(n)
;; on average as you iterate through and remove each first element and add it
;; to the second list until there is none left in the first list
;; so therefore it would just be O(n).