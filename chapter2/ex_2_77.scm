; apply-generic is invoked 2 times. First, the procedure of magnitude on
; type (complex) is called, and then the procedure of magnitude on type 
; (rectangular) is called to obtain the final output.

; (magnitude z) 
; -> (magnitude (cons complex (cons rectangular (cons 3 4)))
; -> (apply-generic 'magnitude (cons complex (cons rectangular (cons 3 4))))
; -> (magnitude (cons rectangular (cons 3 4)))
; -> (apply-generic 'magnitude (cons rectangular (cons 3 4)))
; -> (magnitude (cons 3 4))
; -> (sqrt (+ (square (real-part (cons 3 4)))
;             (square (imag-part (cons 3 4)))))
; -> 5
