(define (equal? a b)
  (cond ((not (and (pair? a) (pair? b))) 
         (eq? a b))
        ((and (pair? a) (pair? b) (equal? (car a) 
                                          (car b))) 
         (equal? (cdr a) (cdr b)))
        (else #f)))
