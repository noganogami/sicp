(define (deriv exp var)
(cond ((number? exp) 0)
      ((variable? exp) (if (same-variable? exp var) 1 0)) 
      (else ((get 'deriv (operator exp))
             (operands exp) var)))) 
(define (operator exp) (car exp)) 
(define (operands exp) (cdr exp))


; a
; This deriv calls the appropriate procedure for the operator symbol
; behaving as a type tag. Therefore, number? and variable?, whose type cannot; be determined by the operator symbol, were not assimilated.


; b
(define (install-sum-package)
  (define (addend s) (car s))
  (define (augend s) (cadr s))
  (define (make-sum a1 a2) 
    (cond ((=number? a1 0) a2) 
          ((=number? a2 0) a1)
          ((and (number? a1) (number? a2)) 
           (+ a1 a2))
          (else (list '+ a1 a2))))
  (define (deriv-sum exp var)
    (make-sum (deriv (addend exp) var)
              (deriv (augend exp) var)))
  (put 'make-sum '+ make-sum)
  (put 'deriv '+ deriv-sum)
  'done)

(define (make-sum a1 a2)
  ((get 'make-sum '+) a1 a2))

(define (install-product-package)
  (define (multiplier p) (car p))
  (define (multiplicand p) (cadr p))
  (define (make-product m1 m2)
    (cond ((or (=number? m1 0) (=number? m2 0)) 0)
          ((=number? m1 1) m2)
          ((=number? m2 1) m1)
          ((and (number? m1) (number? m2)) (* m1 m2)) 
          (else (list '* m1 m2))))
  (define (deriv-product exp var)
         (make-sum
           (make-product (multiplier exp)
                         (deriv (multiplicand exp) var))
           (make-product (deriv (multiplier exp) var) 
                         (multiplicand exp))))
  (put 'make-product '* make-product)
  (put 'deriv '* deriv-product)
  'done)


; c
(define (install-exponentiation-package)
  (define (base e) (car e))
  (define (exponent e) (cadr e))
  (define (make-exponentiation base exp)
    (cond ((=number? exp 0) 1)
          ((=number? exp 1) base)
          ((=number? base 1) 1)
          ((and (number? base) (number? exp)) (expt base exp)) 
          (else (list '** base exp))))
  (define (deriv-exponentiation exp var)
         (make-product (exponent exp)
                       (make-product 
                         (make-exponentiation (base exp)
                                              (make-sum (exponent exp) -1))
                         (deriv (base exp) var))))
  (put 'make-exponentiation '** make-exponentiation)
  (put 'deriv '** deriv-exponentiation)
  'done)


; d
(put 'operator 'deriv deriv-operator)
