(list 1 (list 2 (list 3 4)))

; (1 (2 (3 4)))
;   ^
;  / \
; 1   ^ (2 (3 4))
;    / \
;   2   ^ (3 4)
;      / \
;     3   4
;
;                          (2 (3 4))  (3 4)
;                              |        |
;                              v        v
;                    ___      ___      ___      ___
; (1 (2 (3 4))) --->|*|*|--->|*|*|--->|*|*|--->|*|/|
;                    ---      ---      ---      ---
;                    |        |        |        |
;                    v        v        v        v
;                    1        2        3        4
     