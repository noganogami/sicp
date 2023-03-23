(define (adjoin-set x set) 
  (cond ((null? set) (list x))
        ((< (weight x) (weight (car set))) (cons x set)) 
        (else (cons (car set)
                    (adjoin-set x (cdr set))))))

(define (make-leaf-set pairs) 
  (if (null? pairs)
    '()
    (let ((pair (car pairs)))
      (adjoin-set (make-leaf (car pair)    ; symbol
                             (cadr pair))  ; frequency
                  (make-leaf-set (cdr pairs)))))) 


(define (generate-huffman-tree pairs) 
  (successive-merge (make-leaf-set pairs)))

(define (successive-merge ordered-leaf-set)
  (let ((merged-elements (make-code-tree (car ordered-leaf-set) 
                                         (cadr ordered-leaf-set))))
    (if (null? (cddr ordered-leaf-set)) ; two elements
      merged-elements
      (successive-merge (adjoin-set merged-elements
                                    (cddr ordered-leaf-set))))))
