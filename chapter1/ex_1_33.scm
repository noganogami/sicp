(define (filtered-accumulate filter combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) 
            (if (filter a) 
              (combiner result (term a)) 
              result))))
  (iter a null-value))

(define (sum-square-prime a b)
  (filtered-accumulate prime? + 0 square a inc b))

(define (product-relatively-prime n)
  (define (relatively-prime? x)
    (= (gcd n x) 1))
  (filtered-accumulate relatively-prime? * 1 identity 1 inc n))
