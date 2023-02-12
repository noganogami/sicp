(define (double f)
  (lambda (x) (f (f x))))

(((double (double double)) inc) 5) ; inc applies 16 times.

(((double (double double)) f) x)
(((double double) ((double double) f)) x)
(((double double) (double(double f)) x)
((double(double(double(double f)))) x)
