(define (next n)
  (if (= n 2) 3 (+ n 2)))
(define (smallest-divisor n) (find-divisor n 2)) 
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor) 
        (else (find-divisor n (next test-divisor)))))
(define (divides? a b) (= (remainder b a) 0))


; timed-prime-test
; 1009, 1013, 1019 -> 3us
; 10007, 10009, 10037 -> 10us
; 100003, 100019, 100043 -> 31us
; 1000003, 1000033, 1000037 -> 97us

; It is faster than Ex 1.22, but the speed is about 1.5 times faster, not twice as fast
; This is due to need to perform extra if statement
