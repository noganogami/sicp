(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (nth-root x nth damp)
  (fixed-point ((repeated average-damp damp) 
                (lambda (y) (/ x 
                               (fast-expt y (- nth 1))))) 
               1.0))
; dumping is require (floor log_2 n)) times.
(define (nth-root x nth)
  (fixed-point ((repeated average-damp (floor (log nth 2)))
                (lambda (y) (/ x 
                               (fast-expt y (- nth 1))))) 
               1.0))
; n -> min dump
; 1 -> 1
; 2 -> 1
; 3 -> 1
; 4 -> 2
; 5 -> 2
; 6 -> 2
; 7 -> 2
; 8 -> 3
; 9 -> 3
; 10 -> 3
; 11 -> 3
; 12 -> 3
; 13 -> 3
; 14 -> 3
; 15 -> 3
; 16 -> 4
; 17 -> 4
; 18 -> 4
; 19 -> 4
; 20 -> 4

