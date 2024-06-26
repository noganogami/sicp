(define (midpoint-segment seg)
  (make-point (average (x-point (start-segment seg)) 
                        (x-point (end-segment seg)))
               (average (y-point (start-segment seg))
                        (y-point (end-segment seg)))))

(define (make-point x y) (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))

(define (print-point p) 
  (newline)
  (display "(") 
  (display (x-point p)) 
  (display ",")
  (display (y-point p))
  (display ")"))

(define (make-segment p1 p2) (cons p1 p2))
(define (start-segment seg) (car seg))
(define (end-segment seg) (cdr seg))


(print-point 
  (midpoint-segment 
    (make-segment (make-point 3 4)
                  (make-point 5 6)))) ; (4, 5) 
