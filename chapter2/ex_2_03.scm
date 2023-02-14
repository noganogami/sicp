(define (perimeter-rect rect)
  (* 2 (+ (width-rect rect)
          (height-rect rect))))

(define (area-rect rect)
  (* (width-rect rect) (height-rect rect)))

; helper functions
(define (distance-point p1 p2)
  (sqrt (+ (square (- (x-point p2) (x-point p1)))
           (square (- (y-point p2) (y-point p1))))))

(define (length-segment seg)
  (distance-point (start-segment seg) (end-segment seg)))

; 1st implementation
; the representation by one diagonal and the angle between diagonals
(define (make-rectangle seg theta) (cons seg theta))
(define (diagonal-rect rect) (car rect))
(define (angle-rect rect) (cdr rect))

(define (width-rect rect)
  (* (length-segment (diagonal-rect rect))
     (abs (cos (/ (angle-rect rect) 2)))))
(define (height-rect rect)
  (* (length-segment (diagonal-rect rect))
     (abs (sin (/ (angle-rect rect) 2)))))


; 2nd implementation
; the representation by one of the sides and the gap between the side and the parallel side
(define (make-rectangle seg gap) (cons seg gap))
(define (base-side rect) (car rect))
(define (side-gap rect) (cdr rect))

(define (width-rect rect)
  (side-gap rect))
(define (height-rect rect)
  (length-segment (base-side rect)))
