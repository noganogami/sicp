(define (unique-triples n)
  (flatmap (lambda (pair)  
             (map (lambda (k) (append pair (list k))) 
                  (enumerate-interval 1 (-(cadr pair) 1))))
           (unique-pairs n)))
(define (find-triples-sum s n)
  (define (sum-of-triple triple)
    (accumulate + 0 triple))
  (filter (lambda (t) (= (sum-of-triple t) s))
          (unique-triples n)))