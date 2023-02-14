; Both 2 and 3 are prime primenumbers, 
; so given 2^a * 3^b, a and b are uniquely decided.

(define (cons x y)
  (* (expt 2 x) (expt 2 y)))

(define (car z)
  (define (iter n count)
    (if (not (= (remainder n 2) 0))
      count
      (iter (/ n 2) (+ count 1))))
  (iter z 0))

(define (car z)
  (define (iter n count)
    (if (not (= (remainder n 3) 0))
      count
      (iter (/ n 3) (+ count 1))))
  (iter z 0))
