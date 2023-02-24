(use gl)
(use gl.glut)

(define (accumulate op initial sequence) 
  (if (null? sequence)
    initial
    (op (car sequence)
        (accumulate op initial (cdr sequence)))))

(define (make-vect x y)
  (cons x y))
(define (xcor-vect v)
  (car v))
(define (ycor-vect v)
  (cdr v))

(define (add-vect v1 v2)
  (make-vect (+ (xcor-vect v1) (xcor-vect v2))
             (+ (ycor-vect v1) (ycor-vect v2))))
(define (sub-vect v1 v2)
  (make-vect (- (xcor-vect v1) (xcor-vect v2))
             (- (ycor-vect v1) (ycor-vect v2))))
(define (scale-vect s v)
  (make-vect (* s (xcor-vect v))
             (* s (ycor-vect v))))

(define (make-frame origin edge1 edge2)
  (cons origin (cons edge1 edge2)))

(define (origin-frame frame) (car frame))
(define (edge1-frame frame) (cadr frame))
(define (edge2-frame frame) (cdr (cdr frame)))


(define (make-segment start end)
  (cons start end))
(define (start-segment seg)
  (car seg))
(define (end-segment seg)
  (cdr seg))

(define (frame-coord-map frame) 
  (lambda (v)
    (add-vect
      (origin-frame frame)
      (add-vect (scale-vect (xcor-vect v) (edge1-frame frame))
                (scale-vect (ycor-vect v) (edge2-frame frame))))))

(define (segments->painter segment-list) 
  (lambda (frame)
    (for-each
      (lambda (segment)
        (draw-line 
          ((frame-coord-map frame)
           (start-segment segment)) 
          ((frame-coord-map frame)
           (end-segment segment)))) 
      segment-list)))

(define (transform-painter painter origin corner1 corner2)
  (lambda (frame)
    (let ((m (frame-coord-map frame)))
      (let ((new-origin (m origin)))
        (painter (make-frame
                   new-origin
                   (sub-vect (m corner1) new-origin)
                   (sub-vect (m corner2) new-origin)))))))

(define (identity painter) painter)
(define (flip-vert painter)
  (transform-painter painter
                     (make-vect 0.0 1.0)
                     (make-vect 1.0 1.0)
                     (make-vect 0.0 0.0)))
(define (flip-horiz painter)
  (transform-painter painter
                     (make-vect 1.0 0.0)
                     (make-vect 0.0 0.0)
                     (make-vect 1.0 1.0)))
(define (rotate90 painter) 
  (transform-painter painter
                     (make-vect 1.0 0.0) 
                     (make-vect 1.0 1.0) 
                     (make-vect 0.0 0.0)))
(define (rotate180 painter)
  (transform-painter painter
                     (make-vect 1.0 1.0)
                     (make-vect 0.0 1.0)
                     (make-vect 1.0 0.0)))
(define (rotate270 painter)
  (transform-painter painter
                     (make-vect 0.0 1.0)
                     (make-vect 0.0 0.0)
                     (make-vect 1.0 1.0)))
(define (beside painter1 painter2)
  (let ((split-point (make-vect 0.5 0.0)))
    (let ((paint-left 
            (transform-painter
              painter1
              (make-vect 0.0 0.0) 
              split-point 
              (make-vect 0.0 1.0)))
          (paint-right 
            (transform-painter
              painter2
              split-point
              (make-vect 1.0 0.0) 
              (make-vect 0.5 1.0))))
      (lambda (frame) 
        (paint-left frame) 
        (paint-right frame)))))
(define (below painter1 painter2)
  (rotate270 
    (beside (rotate90 painter2) 
            (rotate90 painter1))))

(define (up-split painter n)
  (if (= n 0) 
    painter
    (let ((smaller (up-split painter (- n 1))))
      (below painter (beside smaller smaller)))))
(define (corner-split painter n)
  (if (= n 0)
    painter
    (let ((up (up-split painter (- n 1)))
          (right (right-split painter (- n 1))))
      (let ((top-left (beside up up))
            (bottom-right (below right right)) 
            (corner (corner-split painter (- n 1))))
        (beside (below painter top-left)
                (below bottom-right corner))))))
(define (right-split painter n) 
  (if (= n 0)
    painter
    (let ((smaller (right-split painter (- n 1))))
      (beside painter (below smaller smaller)))))

(define (square-of-four tl tr bl br) 
  (lambda (painter)
    (let ((top (beside (tl painter) (tr painter))) 
          (bottom (beside (bl painter) (br painter))))
      (below bottom top))))

(define (square-limit painter n)
  (let ((combine4 (square-of-four flip-horiz identity
                                  rotate180 flip-vert))) 
    (combine4 (corner-split painter n))))


(define (wave)
  (define (coords->segs coords)
    (if (null? (cdr coords))
      '()
      (cons (make-segment (car coords) (cadr coords))
            (coords->segs (cdr coords)))))
  (let ((list-of-coords (list (list (make-vect 0.45 1.0)
                                    (make-vect 0.4 0.875)
                                    (make-vect 0.45 0.775)
                                    (make-vect 0.45 0.75)
                                    (make-vect 0.35 0.75)
                                    (make-vect 0.2 0.6)
                                    (make-vect 0.0 0.775))
                              (list (make-vect 0.55 1.0)
                                    (make-vect 0.6 0.875)
                                    (make-vect 0.55 0.775)
                                    (make-vect 0.55 0.75)
                                    (make-vect 0.65 0.75)
                                    (make-vect 1.0 0.4))
                              (list (make-vect 0.0 0.7)
                                    (make-vect 0.2 0.5)
                                    (make-vect 0.4 0.65)
                                    (make-vect 0.4 0.4)
                                    (make-vect 0.3 0.0))
                              (list (make-vect 1.0 0.35)
                                    (make-vect 0.6 0.65)
                                    (make-vect 0.6 0.4)
                                    (make-vect 0.7 0.0))
                              (list (make-vect 0.4 0.0)
                                    (make-vect 0.5 0.35)
                                    (make-vect 0.6 0.0))
                                )))
    (segments->painter (accumulate append 
                                   '() 
                                   (map coords->segs list-of-coords)))))

(define (draw-line v1 v2)
  (gl-vertex (xcor-vect v1) (ycor-vect v1))
  (gl-vertex (xcor-vect v2) (ycor-vect v2)))

(define f (make-frame (make-vect -1 -1)
                      (make-vect 2 0)
                      (make-vect 0 2)))
(define f2 (make-frame (make-vect -0.7 -0.7)
                      (make-vect 0.7 0.7)
                      (make-vect 0 0.9)))

(define (draw)
  (gl-clear GL_COLOR_BUFFER_BIT)
  (gl-begin GL_LINES)
  ((square-limit (wave) 4) f)
  (gl-end)
  (gl-flush))

(define (main args)
  (glut-init args)
  (glut-init-display-mode GLUT_RGB)
  (glut-init-window-size 500 500)
  (glut-init-window-position 0 0)

  (glut-create-window "waves")

  (glut-display-func draw)
  (glut-keyboard-func (lambda (k x y) 
                        (if (= k (char->integer #\escape))
                          (exit))))
  (glut-main-loop)
  0)
