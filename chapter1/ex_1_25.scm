(define (expmod base exp m)
  (remainder (fast-expt base exp) m))

(define (expmod base exp m) 
  (cond ((= exp 0) 1)
        ((even? exp) 
         (remainder
           (square (expmod base (/ exp 2) m))
           m)) 
        (else
          (remainder
            (* base (expmod base (- exp 1) m)) 
            m))))

; two expmod algorithms are return same result, but the growth of order is different
