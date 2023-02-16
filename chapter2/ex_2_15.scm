(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))
(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval
      one (add-interval (div-interval one r1)
                        (div-interval one r2)))))
; test
(define A (make-center-percent 10 5))
(define B (make-center-percent 20 5))

(par1 A B) ; (5.73015873015873 . 7.7368421052631575)
(par2 A B) ; (6.333333333333334 . 7.0)

(par1 A A) ; (4.2976190476190474 . 5.802631578947368)
(par2 A A) ; (4.75 . 5.25)

; Even if the functions get same inputs, the functions have no way of 
; knowing that the input values are equal. 
; Thus, it doesn't be A - A = 0 or A/A = 1, and the result has uncertainty.
; Since per1 contain a division of itself, unlike per2, 
; so per2 can compute more accurate results than per1.
