(define call/cc call-with-current-continuation)

(define halt (call/cc (lambda (k) k)))

(define multiply
  (lambda (n)
    (if (procedure? halt)
        (letrec
            ((looper (lambda (t l)
                     (if (or (null? l) (zero? (car l)))
                         (halt t)
                         (* (* t (car l) (looper (* t (car l)) (cdr l))))))))
            (looper 1 n))
          halt)))

