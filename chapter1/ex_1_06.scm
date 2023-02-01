(define (sqrt-iter guess x) 
  (if (good-enough? guess x)
    guess
    (sqrt-iter (improve guess x) x)))
(define (improve guess x)
  (average guess (/ x guess)))
(define (average x y)
  (/ (+ x y) 2))
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))
(define (sqrt x)
  (sqrt-iter 1.0 x))

;
; 
;  (define (new-if (cond (predicate then-clause)
;        (else else-clause)))))
;
; Because 'if' is special form that doesn't use 
; applicative-order evaluation, it only evaluates
; one of operands but 'new-if' evaluates both operands.
; Therefore, when 'new-if' is used insted of 'if',
; 'sqrt-iter' is called recursively without a return 
; statement.
;
;
