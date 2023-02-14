(define (cons x y)
  (lambda (m) (m x y)))
(define (car z)
  (z (lambda (p q) p)))
(define (cdr z)
  (z (lambda (p q) q)))

;car
(car (cons a b))
(car (lambda (m) (m a b)))
((lambda (m) (m a b)) (lambda (p q) p))
((lambda (p q) p) a b)
p

;cdr
(cdr (cons a b))
(cdr (lambda (m) (m a b)))
((lambda (m) (m a b)) (lambda (p q) q))
((lambda (p q) q) a b)
q
