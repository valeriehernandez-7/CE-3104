#lang racket

#|
  Calcula el factorial de n [n! = n(n-1)!]
  @param n
  @return number
|#
(define (factorial n)
  (cond
    ((equal? n 0) 1)
    ((equal? n 1) 1)
    (else (* n (factorial (- n 1))))
  )
)

#|
  Calcula la serie de fibonacci de n [f_n = f_n-1 + f_n-2]
  @param n
  @return number
|#
(define (fibonacci n)
  (cond
    ((equal? n 0) 0)
    ((equal? n 1) 1)
    (else (+ (fibonacci (- n 1)) (fibonacci (- n 2))))
  )
)

#|
  Verifica si el elemento es miembro de la lista
  @param elemento
  @param lista
  @return boolean
|#
(define (miembro elemento lista)
  (cond
    ((null? lista) #f)
    ((equal? elemento (car lista)) #t)
    (else (miembro elemento (cdr lista)))
  )
)

#|
  Eliminar primera coincidencia del elemento en la lista
  @param elemento
  @param lista
  @return list
|#
(define (eliminar-primer elemento lista)
  (cond
    ((null? lista) lista)
    ((equal? elemento (car lista)) (cdr lista))
    (else (cons (car lista) (eliminar-primer elemento (cdr lista))))
  )
)

#|
  Elimina todas las coincidencias del elemento en la lista
  @param elemento
  @param lista
  @return list
|#
(define (eliminar elemento lista)
  (cond
    ((null? lista) lista)
    ((equal? elemento (car lista)) (eliminar elemento (cdr lista)))
    (else (cons (car lista) (eliminar elemento (cdr lista))))
  )
)

#|
  Filtra de manera ascendente la lista recibida comparando 
  los elementos de la lista con el elemento pivote
  @param pivote
  @param lista
  @return list
|#
(define (quicksort-filtrar pivote lista)
  (cond 
    ((null? lista) '())
    ((pivote (car lista)) (cons (car lista) (quicksort-filtrar pivote (cdr lista))))
    (else (quicksort-filtrar pivote (cdr lista)))
  )
)

#|
  Aplica el algoritmo Quicksort de orden ascendente a la lista recibida,
  utilizando el método quicksort-filtrar cómo auxiliar
  @param lista
  @return list
|#
(define (quicksort lista)
  (cond 
    ((null? lista) '())
    (else (
        let* (
          (pivote (car lista))
          (elementos (cdr lista))
          (menores (quicksort-filtrar (lambda (elemento) (< elemento pivote)) elementos))
          (mayores (quicksort-filtrar (lambda (elemento) (>= elemento pivote)) elementos))
        )
        (append (quicksort menores) (list pivote) (quicksort mayores))
      )
    )
  )
)

; - - - - - Test - - - - -

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
(eliminar-primer 'a '(a b c a))
(eliminar-primer 'a '(b c d))

(display "\nEliminar\n")
(eliminar 'a '(a b c a))
(eliminar 'a '(b c d))

(display "\nQuicksort\n")
(quicksort '(3 2 1))
(quicksort '(2 3 4 1 1 2 5))