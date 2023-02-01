; If number is smaller than the tolerance,
; the number is own square root.
;
; If number is too large for the tolerance,
; the number of loop approache infinity.
;
;
;
;
;
;
(define (new-good-enough? guess x)
  (< (abs (- (square guess) x)) (* 0.001 guess))
