(define (sum term a next b) 
  (if (> a b)
    0
    (+ (term a)
       (sum term (next a) next b))))

(define (simpson-integral f a b n)
  (define (culc-sum h)
    (define (next x)
      (+ x (* 2 h)))
    (* (/ h 3) (+ a 
                  (* 4 (sum f (+ a h) next (- b h)))
                  (* 2 (sum f (+ a (* 2 h)) next (- b h)))
                  b)))
  (culc-sum (/ (- b a) n)))

(simpson-integral cube 0 1 100) ; 1/4
(simpson-integral cube 1 1 1000) ; 1/4
