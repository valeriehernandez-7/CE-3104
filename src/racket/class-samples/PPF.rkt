#lang racket

#|
  Factorial [n! = n(n-1)!]
  @param n
|#
(define (factorial n)
  (cond
    ((equal? n 0) 1)
    ((equal? n 1) 1)
    (else (* n (factorial (- n 1))))
    )
  )

#|
  Fibonacci [f_n = f_n-1 + f_n-2]
  @param n
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
  Verifica si el elemento es miembro de la lista
  @param elemento
  @param lista
|#
(define (miembro elemento lista)
  (cond
    ((null? lista) #f)
    ((equal? elemento (car lista)) #t)
    (else (miembro elemento (cdr lista)))
    )
  )

#|
  EliminarPrimer
  Eliminar primera coincidencia del elemento en la lista
  @param elemento
  @param lista
|#
(define (eliminarPrimer elemento lista)
  (cond
    ((null? lista) lista)
    ((equal? elemento (car lista)) (cdr lista))
    (else (cons (car lista) (eliminarPrimer elemento (cdr lista))))
    )
  )

#|
  Eliminar
  Elimina todas las coincidencias del elemento en la lista
  @param elemento
  @param lista
|#
(define (eliminar elemento lista)
  (cond
    ((null? lista) lista)
    ((equal? elemento (car lista)) (eliminar elemento (cdr lista)))
    (else (cons (car lista) (eliminar elemento (cdr lista))))
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

(display "\nMiembro\n")
(miembro 'a '(a b c))
(miembro 'a '(b c d))

(display "\nEliminarPrimer\n")
(eliminarPrimer 'a '(a b c a))
(eliminarPrimer 'a '(b c d))

(display "\nEliminar\n")
(eliminar 'a '(a b c a))
(eliminar 'a '(b c d))