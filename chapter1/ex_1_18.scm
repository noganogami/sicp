(define (mult a b) 
  (define (mult-iter a b product)
    (cond ((= b 0) product)
          ((even? b) (mult-iter (double a) (halve b) product))
          (else (mult-iter a (- b 1) (+ product a)))))
  (mult-iter a b 0))

