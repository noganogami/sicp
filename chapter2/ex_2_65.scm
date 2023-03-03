(define (element-of-set? x set) 
  (cond ((null? set) false)
        ((= x (entry set)) true) 
        ((< x (entry set))
         (element-of-set? x (left-branch set))) 
        ((> x (entry set))
         (element-of-set? x (right-branch set)))))

(define (adjoin-set x set)
  (cond ((null? set) (make-tree x '() '()))
        ((= x (entry set)) set) 
        ((< x (entry set))
         (make-tree (entry set)
                    (adjoin-set x (left-branch set))
                    (right-branch set))) 
        ((> x (entry set))
         (make-tree (entry set) (left-branch set) 
                    (adjoin-set x (right-branch set))))))


(define (union-tree-set tree1 tree2)
  (list->tree 
    (union-set (tree->list-2 tree1)
               (tree->list-2 tree2))))
         
(define (intersection-tree-set tree1 tree2)
  (list->tree 
    (intersection-set (tree->list-2 tree1)
                      (tree->list-2 tree2))))
