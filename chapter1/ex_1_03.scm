(define (square a) (* a a))

(define (sum-of-square a b)
  (+ (square a) (square b)))

(define (<= a b) (or (< a b) (= a b)))

(define (sum-of-square-of-two-larger a b c)
  (cond ((and (<= a b) (<= a c)) (sum-of-square b c))
        ((and (<= b a) (<= b c)) (sum-of-square a c))
        (else (sum-of-square a b))))
