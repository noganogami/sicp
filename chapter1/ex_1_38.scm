(define (euler-cf k)
  (define (sequence x)
    (if (= (remainder x 3) 2)
      (* 2 (/ (+ x 1) 3))
      1))
  (cont-frac (lambda (i) 1.0) sequence k))

(+ (euler-cf 20) 2) ; 2.718281828459045
