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
(define (fermat-test n) 
  (define (try-it a)
    (= (expmod a n n) a))
  (use srfi-27)
  (try-it (+ 1 (random-integer (- n 1)))))
(define (fast-prime? n times) 
  (cond ((= times 0) #t)
        ((fermat-test n) (fast-prime? n (- times 1))) 
        (else #f)))
(define (timed-fast-prime-test n) 
  (newline)
  (display n)
  (start-fast-prime-test n (runtime)))
(define (start-fast-prime-test n start-time) 
  (if (fast-prime? n 100)
    (report-prime (- (runtime) start-time)))) 
(define (report-prime elapsed-time)
  (display " *** ") 
  (display elapsed-time))

; 1009, 1013, 1019 -> 450us
; 10007, 10009, 10037 -> 550us
; 100003, 100019, 100043 -> 670us
; 1000003, 1000033, 1000037 -> 750us

; When the size of prime is larger, the time increased by a constant amount
; log(1000000) - log(1000) = 3 ----> this means that a constant increase is required
