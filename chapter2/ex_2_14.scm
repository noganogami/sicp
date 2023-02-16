(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))
(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y))) 
        (p3 (* (upper-bound x) (lower-bound y))) 
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4) 
                   (max p1 p2 p3 p4))))

; test
(define A (make-center-percent 10 5))
(define B (make-center-percent 20 5))

(div-interval A A) ; (0.9047619047619047 . 1.1052631578947367)
(div-interval A B) ; (0.45238095238095233 . 0.5526315789473684)

(center (div-interval A A)) ; 1.0050125313283207

; A/A is expected to be 1, but the result has width 
; and the center is not exactly 1.
