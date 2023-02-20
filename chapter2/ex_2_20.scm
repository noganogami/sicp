(define (same-parity first . rest)
  (define condition (if (even? first) even? odd?))
  (define (iter list1 list2)
    (if (null? list1)
      list2
      (if (condition (car list1))
        (iter (cdr list1) (append list2 (list (car list1))))
        (iter (cdr list1) list2))))
  (iter rest (list first)))
