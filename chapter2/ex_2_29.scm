; constructor
(define (make-mobile left right)
  (list left right))
(define (make-branch length structure)
  (list length structure))
; selector
(define (left-branch mobile)
  (car mobile))
(define (right-branch mobile)
  (car (cdr mobile)))
(define (branch-length branch)
  (car branch))
(define (branch-structure branch)
  (car (cdr branch)))


(define (total-weight mobile)
  (cond ((null? mobile) 0)
        ((not (pair? mobile)) mobile)
        (else (+ (total-weight (branch-structure (left-branch mobile)))
                 (total-weight (branch-structure (right-branch mobile)))))))

(define (balanced? mobile)
  (if (= (* (branch-length (left-branch mobile))
            (total-weight (branch-structure (left-branch mobile))))
         (* (branch-length (right-branch mobile))
            (total-weight (branch-structure (right-branch mobile)))))
    #t
    #f))

;test
(define m (make-mobile (make-branch 3 4)
                       (make-branch 2 6)))
(define mm (make-mobile (make-branch 2 10)
                        (make-branch 3 (make-mobile (make-branch 7 9)
                                                    (make-branch 4 0))))))
(total-weight m) ; 10
(total-weight mm) ; 19
(balanced? m) ; #t
(balanced? mm) ; #f

; When the constructors is changed, only the selectors need to be changed
; to convert to the new representation.

; new constructor
(define (make-mobile left right) (cons left right)) 
(define (make-branch length structure)
  (cons length structure))
; new selector
(define (left-branch mobile) (car mobile))
(define (right-branch mobile) (cdr mobile))
(define (branch-length branch) (car branch))
(define (branch-structure branch) (cdr branch))
