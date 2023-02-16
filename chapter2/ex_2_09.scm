(define (width-interval interval) 
  (/ (- upper-bound lower-bound)
     2))

; width of add-interval is function 
; (width, width) -> width
(width-interval (add-interval x y))
(/ (- (+ (upper-bound x) (upper-bound y))
      (+ (lower-bound x) (lower-bound y)))
   2)
(/ (+ (- (upper-bound x) (lower-bound x))
      (- (upper-bound y) (lower-bound y)))
   2)
(+ (width-interval x) (width-interval y))

; If the width of the mul-interval is a function of the widths of the two inputs,
; then the result should have the same width, 
; regardless defferent intervals of the same width are used as inputs.

; However;  [5,10] * [0,10] = [0,100]
;          [-5,10] * [0,10] = [-50,0]



