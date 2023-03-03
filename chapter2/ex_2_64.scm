(define (list->tree elements)
  (car (partial-tree elements (length elements))))
(define (partial-tree elts n) 
  (if (= n 0)
    (cons '() elts)
    (let ((left-size (quotient (- n 1) 2)))
      (let ((left-result
              (partial-tree elts left-size)))
        (let ((left-tree (car left-result)) 
              (non-left-elts (cdr left-result)) 
              (right-size (- n (+ left-size 1))))
          (let ((this-entry (car non-left-elts)) 
                (right-result
                  (partial-tree
                    (cdr non-left-elts) 
                    right-size)))
            (let ((right-tree (car right-result)) 
                  (remaining-elts
                    (cdr right-result))) 
              (cons (make-tree this-entry
                               left-tree
                               right-tree) 
                    remaining-elts))))))))

; a
;
; partial-tree devides an ordered list into three parts. The median of the 
; list is the entry, the items smaller than the entry are left-tree, and the
; items larger than the entry are right-tree. Furthermore, subtrees created
; in this way is applied the partial-tree procedure recursively.
;
;      5
;    /   \
;   1     9
;  / \   / \
;'()  3 7   11

; b
; Let T(n) be the time taken by the partial-tree with n elements.
; T(1) = O(1)
; T(n) = 2T(n/2) + O(1)
; --> T(n) = O(n)
