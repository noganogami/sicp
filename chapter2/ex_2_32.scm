; The set of all subsets of a set can be defined as the union of all subsets; excluding the first element and that subsets to which first element is 
; added. Thus, it is able to be represented recursively

(define (subsets s)
  (if (null? s)
    (list '())
    (let ((rest (subsets (cdr s))))
      (append rest 
              (map (lambda (x) (cons (car s) x))
                   rest)))))
