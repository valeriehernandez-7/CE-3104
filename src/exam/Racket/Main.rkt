#lang racket


(define (bubble-sort lst)
    (cond
        ((null? (cdr lst)) lst)
        (else
            (cond 
                ((< (car lst) (cadr lst)) (cons (car lst) (bubble-sort (cdr lst))))
                (else (cons (cadr lst) (bubble-sort (cons (car lst) (cddr lst)))))
            )
        )
    )
)


(define (bubble-aux lst size)
    (cond 
        ((equal? size 1) (bubble-sort lst))
        (else (bubble-aux (bubble-sort lst) (- size 1)))
    )
)


(define (bubble lst)
    (cond 
        ((null? lst) '())
        (else (bubble-aux lst (length lst)))
    )
)


(define (main)
    (displayln (bubble '(126 43 26 1 113)))
    (displayln (bubble '(777 7777 7 77 77777)))
)