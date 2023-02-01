(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

; y  > 0
;
; (a-plus-abs-b x y)
; ((if (> y 0) + -) x y)
; (+ x y)
