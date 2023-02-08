(define (mult a b)
  (cond ((= b 0) 0)
        ((even? b) (double (mult a (halve b))))
        (else (+ a (mult a (- b 1)))))) 
(define (double a) (+ a a))
(define (halve a) (/ a 2))
