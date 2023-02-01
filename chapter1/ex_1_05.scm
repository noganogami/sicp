(define (p) (p))
(define (test x y)
  (if (= x 0) 0 y))

(test 0 (p))

; applicative-order evaluation
;
; infinite loop 
;
;
;
; normal-order evaluation
;
; (test 0 (p)) 
; ((if (= 0 0) 0 (p)))
; 0
;
;

