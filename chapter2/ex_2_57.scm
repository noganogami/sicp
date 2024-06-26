(define (make-sum a1 . a2) 
  (if (and (pair? a2) (not (null? (cdr a2))))
    (make-sum a1 
              (make-sum-list a2))
    (let ((a2 (car a2)))
      (cond ((=number? a1 0) a2) 
            ((=number? a2 0) a1)
            ((and (number? a1) (number? a2)) 
             (+ a1 a2))
            (else (list '+ a1 a2))))))
(define (addend s) (cadr s))
(define (augend s) (make-sum-list (cddr s)))
(define (make-sum-list s)
  (accumulate make-sum 0 s))

(define (make-product m1 . m2)
  (if (and (pair? m2) (not (null? (cdr m2))))
    (make-product m1 
              (make-product-list m2))
    (let ((m2 (car m2)))
      (cond ((or (=number? m1 0) (=number? m2 0)) 0)
            ((=number? m1 1) m2)
            ((=number? m2 1) m1)
            ((and (number? m1) (number? m2)) (* m1 m2)) 
            (else (list '* m1 m2))))))
(define (multiplier p) (cadr p))
(define (multiplicand p) (make-product-list (cddr p)))
(define (make-product-list p)
  (accumulate make-product 1 p))
