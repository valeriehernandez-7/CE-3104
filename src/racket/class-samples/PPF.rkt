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
  @param pivote de número real de la lista utilizado como referencia de comparación
  @param lista lista de números reales o lista vacía
  @param menores lista de números reales menores al pivote
  @param iguales lista de números reales iguales al pivote
  @param mayores lista de números reales mayores al pivote
  @return lista de números reales o lista vacía
|#
(define (quicksort-filtrar pivote lista menores iguales mayores)
  (cond 
    ((null? lista)
      (append (quicksort menores) iguales (quicksort mayores))
    )
    (else
      (cond
        ((> pivote (car lista))
          (quicksort-filtrar pivote (cdr lista) (cons (car lista) menores) iguales mayores)
        )
        ((< pivote (car lista))
          (quicksort-filtrar pivote (cdr lista) menores iguales (cons (car lista) mayores))
        )
        (else (quicksort-filtrar pivote (cdr lista) menores (cons (car lista) iguales) mayores))
      )
    )
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
    (else (quicksort-filtrar (car lista) lista '() '() '()))
  )
)

; - - - - - Test - - - - -

(display "\n(factorial n)\n")
(factorial 0)
(factorial 1)
(factorial 7)

(display "\n(fibonacci n)\n")
(fibonacci 0)
(fibonacci 1)
(fibonacci 7)

(display "\n(miembro elemento lista)\n")
(miembro 'a '(a b c))
(miembro 'a '(b c d))

(display "\n(eliminar elemento lista)\n")
(eliminar 'a '(a b c a))
(eliminar 'a '(b c d))

(display "\n(quicksort lista)\n")
(quicksort '(3 2 1))
(quicksort '(2 3 4 1 1 2 5))

(display "\n(automovil atributos valores)\n")

(display "\n(arbol-binario-eliminar-nodo arbol)\n")

(display "\n(grafo-recorrer-anchura grafo)\n")

(display "\n(longitud-cola lista)\n")

(display "\n(longitud-pila lista)\n")