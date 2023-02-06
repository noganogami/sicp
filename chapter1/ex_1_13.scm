; Proof fib(n) = ( phi^n - psy^n ) / √5
; ... where phi = (1 + √5) / 2, psy = 1 - phi
;
; fib(0) = ( phi^0 - psy^0 ) / √5 = 0
; fib(1) = ( phi^1 - psy^1 ) / √5 = 1
;
; Assume fib(n) = ( phi^n - psy^n ) / √5 is true for k, k + 1
; Then k + 2...
; fib(k+2) = fib(k) + fib(k+1)
;          = ( phi^k - psy^k ) / √5 + ( phi^(k+1) - psy^(k+1) ) / √5
;          = ( phi^k * (1+phi) - psy^k * (1+psy) ) / √5
;
; Because phi^2 = phi + 1 and psy^2 = psy + 1
; fib(k+2) = ( phi^k * phi^2 ) - psy^k * psy^2 ) / √5
;          = ( phi^(k+2) - psy^(k+2) ) / √5
;
; Therefore, fib(n) = ( phi^n - psy^n ) / √5 is true



; √5 = 2.2360679
; ... |1 - √5| < 2
; |(1-√5) / 2| < 1
; Because 2 < √5, so |(1-√5) / 2√5| < 1/2
; ... |psy^n| / √5 < 1/2 
; 
; Thus, fib(n) is the closest integer to phi^n/√5
