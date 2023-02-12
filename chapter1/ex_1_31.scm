; recursive version
(define (product term a next b)
  (if (> a b)
    1
    (* (term a) 
       (product term (next a) next b))))

; iterative version
(define (product term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (* result (term a)))))
  (iter a 1))

(define (identity x) x)

(define (factorial x)
  (product identity 1 inc x))

(define (pi n)
  (define (next x) (+ x 2))
  (define (term x)
    (/ (* (- x 1) (+ x 1))
       (square x)))
  (product term 3.0 next n))

(* 4 (pi 1000000))
; 3.1415942243865067
