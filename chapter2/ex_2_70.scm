(define lyric '(GET A JOB
                SHA NA NA NA NA NA NA NA NA
                GET A JOB
                SHA NA NA NA NA NA NA NA NA
                WAH YIP YIP YIP YIP YIP YIP YIP YIP YIP
                SHA BOOM))
(define lyric-tree 
  (generate-huffman-tree
    (list (list 'A 2) (list 'GET 2) (list 'SHA 3) (list 'WAH 1)
          (list 'BOOM 1) (list 'JOB 2) (list 'NA 16) (list 'YIP 9))))

(equal? lyric 
        (decode lyric-tree
                (encode lyric lyric-tree))) ; #t


(length lyric) ; 36
; huffman-encoding
(length (encode lyric lyric-tree)) ; 84
; fixed-length-encoding
; In this case, the number of alphabets is 8, so 3 bits are needed.
; 3 * 36 = 108
