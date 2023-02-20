(define (fringe items)
  (define (iter things answer)
    (if (null? things) 
      answer
      (iter (cdr things)
            (append answer
                    (if (pair? (car things))
                       (fringe (car things))
                       (list (car things)))))))
  (iter items '()))

; test
(define x (list (list 1 2) (list 3 4))) ; ((1 2) (3 4))
(fringe x) ; (1 2 3 4)
(fringe (list x x)) ; (1 2 3 4 1 2 3 4)
