; (queens 4) --> ((3 1 4 2), (2 4 1 3))
;                 | |*| | |  | | |*| |
;                 | | | |*|  |*| | | |
;                 |*| | | |  | | | |*|
;                 | | |*| |  | |*| | |

(define (safe? k positions)
  (define (contain? x sequence)
    (define (iter seq)
      (cond ((null? seq) #f)
            ((= x (car seq)) #t)
            (else (iter (cdr seq)))))
    (iter sequence))
  (define (dialog? x sequence n)
      (define (iter seq m)
        (cond ((null? seq) #f)
              ((= (abs (- (car seq) x))
                  (abs (- n m))) 
               #t)
              (else (iter (cdr seq) (- m 1)))))
      (iter sequence (- n 1)))
  (and (not (contain? (car positions) (cdr positions)))
       (not (dialog? (car positions) (cdr positions) k))))

(define (adjoin-position new-row k rest-of-queens)
  (cons new-row rest-of-queens))

(define empty-board '())

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
      (list empty-board)
      (filter
        (lambda (positions) (safe? k positions))
        (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position
                     new-row k rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))
