; a
; Each divisoin's file should attach division's identification to output.
; If a record is not found, #f must be returned.
(define (get-record file employee)
  ((get 'get-record file) employee))


; b
(define (get-salary record)
  ((get 'get-salary (type-tag record)) (content record)))


; c
(define (find-employee-record employee files)
  (if (null? files)
    #f
    (let ((result (get-record (car files) employee)))
      (if (result)
        result
        (find-employee-record employee (cdr files))))))


; d
; If new division's selectors are same format as existing divisions, change
; is not needed.
