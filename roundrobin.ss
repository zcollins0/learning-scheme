(define call/cc call-with-current-continuation)



(define pl
  (lambda (l)
    (if (null? l)
        (remove-from-round-robin)
        (begin (step-and-swap (car l)) (pl (cdr l))))))

(define main
  (lambda lst
    (map (lambda (x) (create pl x)) lst)
    (demand-tokens)))

(define demand-tokens
  (lambda ()
    (let ((temp (demand)))
         (if (null? temp) '() (cons temp (demand-tokens))))))

(define create
  (lambda 