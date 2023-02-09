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

(define (carmichael-test n)
  (define (try-it a)
    (if (= a n)
      #t
      (if (= (expmod a n n) a) (try-it (+ a 1)) #f)))
  (try-it 1))

(carmichael-test 561) ; #t
(carmichael-test 1105) ; #t
(carmichael-test 1729) ; #t
(carmichael-test 2465) ; #t
(carmichael-test 2821) ; #t
(carmichael-test 6601) ; #t
