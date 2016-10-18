(define int-builder$
  (lambda (n)
      (append (list n) (lambda () (int-builder$(+ n 1))))))

(define filter$
  (lambda (num lst)
    (if (null? lst)
        '()
        (if (= (modulo (car lst) num) 0)
            (filter$ num ((cdr lst)))
            (cons (car lst) (lambda () (filter$ num ((cdr lst)))))))))

(define sieve$
  (lambda (lst)
    (if (null? lst)
        '()
        (cons (car lst) (lambda () (sieve$ (filter$ (car lst) ((cdr lst)))))))))

(define stol$
  (lambda (n)
    (take$ n (sieve$ (int-builder$ 2)))))

(define take$
  (lambda (m s)
    (if (or (= m 0) (null? s))
        '()
        (cons (car s) (take$ (- m 1) ((cdr s)))))))