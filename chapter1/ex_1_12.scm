; pascal's triangle starting at (row, column) = (1, 1)
(define (pascal r c)
  (if (or (= c 1) (= r c))
    1
    (+ (pascal (- r 1) (- c 1)) (pascal (- r 1) c))))
