#lang racket

#|
Factorial [n! = n(n-1)!]
|#
(define (factorial num)
  (cond
    ((equal? num 0) 1)
    ((equal? num 1) 1)
    (else (* num (factorial (- num 1))))
  )
)

#|
Fibonacci [f_n = f_n-1 + f_n-2]
|#
(define (fibonacci n)
  (cond
    ((equal? n 0) 0)
    ((equal? n 1) 1)
    (else (+ (fibonacci (- n 1)) (fibonacci (- n 2))))
  )
)

#|
Miembro
|#
(define (miembro elemento lista)
  (cond
    ((null? lista) #f)
    ((equal? elemento (car lista)) #t)
    (else (miembro elemento (cdr lista)))
  )
)

#|
Eliminar
|#
(define (eliminar elemento lista)
  (cond
    ((null? lista) lista)
    ((equal? elemento (car lista)) (cdr lista))
    (else (cons (car lista) (eliminar elemento (cdr lista))))
  )
)

#|
Eliminar todas
|#
(define (eliminarTodas elemento lista)
  (cond
    ((null? lista) lista)
    ((equal? elemento (car lista)) (eliminarTodas elemento (cdr lista)))
    (else (cons (car lista) (eliminarTodas elemento (cdr lista))))
  )
)


#|
(define (quickSortPiv pivote lista)
  
)


(define (quickSort lista)
  (cond
    ((null? lista) lista)
    ()
  )
)
|#

; Test

(display "\nFactorial\n")
(factorial 0)
(factorial 1)
(factorial 7)

(display "\nFibonacci\n")
(fibonacci 0)
(fibonacci 1)
(fibonacci 7)