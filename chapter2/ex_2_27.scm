(define (deep-reverse items)
  (define (iter things answer)
    (if (null? things)
      answer
      (iter (cdr things)
            (cons (if (pair? (car things))
                    (deep-reverse (car things))
                    (car things))
                  answer))))
  (iter items '()))

; test
(define x (list (list 1 2) (list 3 4))) ; ((1 2) (3 4))
(reverse x) ; ((3 4) (1 2))
(deep-reverse x) ; ((4 3) (2 1))
