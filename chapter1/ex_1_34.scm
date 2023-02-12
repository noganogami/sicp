(define (f g) (g 2))

; If interpreter evaluates (f f), it will fail.
; This is due to apply 2 to 2
; (f f) -> (f 2) -> (2 2)
