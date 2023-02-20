; In this implementation, the process of square and adding to the top of the return list is iterated from the top of the argument list.
(define (square-list items) 
  (define (iter things answer)
    (if (null? things) 
      answer
      (iter (cdr things)
            (cons (square (car things))
                  answer))))
  (iter items '()))

; In the following implementation, a square value is paired with a processed
; list, so the result will be like that ((((() . 1) . 4) . 9) . 16)
(define (square-list items) 
  (define (iter things answer)
    (if (null? things) 
      answer
      (iter (cdr things) 
            (cons answer
                  (square (car things))))))
  (iter items '()))
