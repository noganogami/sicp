(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree)) 
(define (right-branch tree) (caddr tree)) 
(define (make-tree entry left right)
  (list entry left right))

(define (tree->list-1 tree) 
  (if (null? tree)
    '()
    (append (tree->list-1 (left-branch tree))
            (cons (entry tree)
                  (tree->list-1 
                    (right-branch tree))))))
     
(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree) 
      result-list
      (copy-to-list (left-branch tree) 
                    (cons (entry tree)
                          (copy-to-list 
                            (right-branch tree) 
                            result-list)))))
  (copy-to-list tree '()))               

; a 
; Using eather procedure, the result is the same list for all trees.

; b
; Let T(n) be the number of steps taken by a balanced tree with n elements.
;
; Using the first procedure,
; T(1) = O(1)
; T(n) = 2T(n/2) + O(n)    (append takes liner time)
; --> T(n) = O(nlog(n))
;
; Using the second procedure,
; T(1) = O(1)
; T(n) = 2T(n/2) + O(1)    (cons takes constant time)
; --> T(n) = O(n)
