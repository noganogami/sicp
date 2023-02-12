; recursive version
(define (cont-frac n d k)
  (define (recur i)
    (if (= i k) 
      (/ (n k) (d k))
      (/ (n i) (+ (d i) (recur (+ i 1))))))
  (recur 1))

; iterative version
(define (cont-frac n d k)
  (define (iter i result)
    (if (= i 0) 
      result
      (iter (- i 1) (/ (n i) (+ (d i) result)))))
  (iter k 0))

; The approximation 1/phi that accurate to 4 decimal places requires 11 terms  for both the recursive and iterative versions.
