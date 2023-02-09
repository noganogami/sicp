(define (miller-rabin-test n) 
  (define (expmod base exp m) 
    (define (check-it a)
      (define (square-mod a square-a)
        (if (and (not (= a 1))
                 (not (= a (- n 1)))
                 (= (remainder square-a m) 1))
          0
          square-a
          ))
      (square-mod a (square a)))
    (cond ((= exp 0) 1)
          ((even? exp) 
           (remainder
             (check-it (expmod base (/ exp 2) m))
             m)) 
          (else
            (remainder
              (* base (expmod base (- exp 1) m)) 
              m))))
  (define (try-it a)
    (= (expmod a (- n 1) n) 1))
  (use srfi-27)
  (try-it (+ 1 (random-integer (- n 1)))))

(define (prime? n times) 
  (cond ((= times 0) #t)
        ((miller-rabin-test n) (prime? n (- times 1))) 
        (else #f)))

; prime
(prime? 1009 100) ; #t
(prime? 1013 100) ; #t
(prime? 1019 100) ; #t
(prime? 10007 100) ; #t
(prime? 10009 100) ; #t
(prime? 10037 100) ; #t
(prime? 100003 100) ; #t
(prime? 100019 100) ; #t
(prime? 100043 100) ; #t
(prime? 1000003 100) ; #t
(prime? 1000033 100) ; #t
(prime? 1000037 100) ; #t
; carmichael
(prime? 561 100) ; #f
(prime? 1105 100) ; #f
(prime? 1729 100) ; #f
(prime? 2465 100) ; #f
(prime? 2821 100) ; #f
(prime? 6601 100) ; #f
