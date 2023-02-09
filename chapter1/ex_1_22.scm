(define (prime? n)
  (= n (smallest-divisor n)))
(define (runtime)
  (let-values (((a b) (sys-gettimeofday)))
  (+ (* a 1000000) b)))
(define (timed-prime-test n) 
  (newline)
  (display n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time) 
  (if (prime? n)
    (report-prime (- (runtime) start-time)))) 
(define (report-prime elapsed-time)
  (display " *** ") 
  (display elapsed-time))
;---------------------------------------------
(define (search-for-primes begin end)
  (define (iter n)
    (cond ((< n end) (timed-prime-test n)
                     (iter (+ n 2)))))
  (iter (if (even? begin) (+ begin 1) begin)))


; 1009, 1013, 1019 -> 5us
; 10007, 10009, 10037 -> 16us
; 100003, 100019, 100043 -> 50us
; 1000003, 1000033, 1000037 -> 157us
; O(√n)
