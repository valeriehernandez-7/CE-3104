#lang racket


#|
  Hernández Fernández Valerie M.

  Programación Funcional
  Taller

  Instituto Tecnológico de Costa Rica
  Área Académica Ingeniería en Computadores

  CE 3104 Lenguajes, Compiladores e Intérpretes
  Ing. Marco Rivera Meneses, MGP
  Grupo 1

  I Semestre
  2023
|#


#|
  Contenidos

  1. (factorial n)
      1.1. > (factorial 0)
      1.2. > (factorial 1)
      1.3. > (factorial 7)
  2. (fibonacci n)
      2.1. > (fibonacci 0)
      2.2. > (fibonacci 1)
      2.3. > (fibonacci 7)
  3. (miembro elemento lista)
      3.1. > (miembro null '())
      3.2. > (miembro 'a '(a b c))
      3.3. > (miembro 'a '(b c d))
  4. (eliminar elemento lista)
      4.1. > (eliminar 'a '(a))
      4.2. > (eliminar 'a '(a b c a))
      4.3. > (eliminar 'a '(b c d))
  5. (quicksort lista)
      5.1. > (quicksort '(7 5))
      5.2. > (quicksort '(3 2 1))
      5.3. > (quicksort '(2 3 4 1 1 2 5))
  6. (automovil valores atributos)
      6.1. > (automovil '(Hatchback Suzuki Forza1 Rojo Si Manual))
      6.2. > (automovil '(Hatchback Suzuki Forza2 Negro Si Automático))
      6.3. > (automovil '(Hatchback Suzuki Forza3 Azul No Manual) '(Tipo Marca Modelo Color AC Tansmisión))
  7. (arbol-binario-eliminar nodo arbol)
      7.1. > (arbol-binario-eliminar 10 '(10 (5 3 8) (15 14 18)))
      7.2. > (arbol-binario-eliminar 3 '(10 (5 3 8) (15 14 18)))
      7.3. > (arbol-binario-eliminar 18 '(10 (5 3 8) (15 14 18)))
  8. (grafo-recorrer-anchura grafo)
      8.1. > (grafo-recorrer-anchura '((A B C) ((A B) (A C) (B C))))
      8.2. > (grafo-recorrer-anchura '((A B C D) ((A B) (B A) (B C) (C A))))
      8.3. > (grafo-recorrer-anchura '((A B C D E F) ((A B) (A C) (A D) (B E) (B F))))
  9. (longitud-cola lista)
      9.1.1. > (longitud-cola '())
      9.1.2. > (longitud-cola '(a b c))
      9.1.3. > (longitud-cola '(1 2 3 4 5))
     (longitud-pila lista)
      9.2.1. > (longitud-pila '())
      9.2.2. > (longitud-pila '(a b c))
      9.2.3. > (longitud-pila '(1 2 3 4 5))
|#


#|
  Calcula el factorial de n [n! = n(n-1)!]
  @param n número entero positivo
  @return número resultante de la aplicación del Factorial
|#
(define (factorial n)
  (cond
    ((equal? n 0) 1)
    ((equal? n 1) 1)
    (else (* n (factorial (- n 1))))
  )
)

#|
  Calcula la serie de Fibonacci de n [f_n = f_n-1 + f_n-2]
  @param n número entero positivo
  @return número resultante de la aplicación de la serie Fibonacci
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
  @param elemento dato que desea verificar pertenencia en la lista
  @param lista de datos
  @return booleano (falso : si no es miembro de la lista , true : si es miembro de la lista)
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
  @param elemento dato que se desea eliminar
  @param lista de datos
  @return lista sin el elemento eliminado
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
  @param pivote número real de la lista utilizado como referencia de comparación
  @param lista lista de números reales
  @param menores lista de números reales menores al pivote
  @param iguales lista de números reales iguales al pivote
  @param mayores lista de números reales mayores al pivote
  @return lista de números reales
|#
(define (quicksort-filtrar lista (pivote (car lista)) (menores '()) (iguales '()) (mayores '()))
  (cond 
    ((null? lista)
      (append (quicksort menores) iguales (quicksort mayores))
    )
    (else
      (cond
        ((> pivote (car lista))
          (quicksort-filtrar (cdr lista) pivote (cons (car lista) menores) iguales mayores)
        )
        ((< pivote (car lista))
          (quicksort-filtrar (cdr lista) pivote menores iguales (cons (car lista) mayores))
        )
        (else (quicksort-filtrar (cdr lista) pivote menores (cons (car lista) iguales) mayores))
      )
    )
  )
)

#|
  Aplica el algoritmo Quicksort de orden ascendente a la lista recibida,
  utilizando el método quicksort-filtrar cómo auxiliar
  @param lista lista de números reales o lista vacía
  @return lista de números reales o lista vacía
|#
(define (quicksort lista)
  (cond 
    ((null? lista) '())
    (else (quicksort-filtrar lista))
  )
)

#|
  Recorre la lista de atributos y valores formando una lista con los 
  primeros elementos de la lista de manera recursiva
  @param valores lista de valores de los atributos especificados
  @param atributos lista de atributos del automovil
  @return lista de pares con el formato (atributo valor)
|#
(define (automovil-config valores atributos)
  (cond
    ((or (null? valores) (null? atributos)) '())
    (else (cons (list (car atributos) (car valores)) (automovil-config (cdr valores) (cdr atributos))))
  )
)

#|
  Verifica que la cantidad de atributos y valores coincida. Utiliza la
  función automovil-config para retornar la lista de pares con los
  atributos y sus respectivos valores
  @param valores lista de valores de los atributos especificados
  @param atributos lista de atributos del automovil
  @return lista de pares o error según el cumplimiento de condiciones
|#
(define (automovil valores (atributos '(Tipo Marca Modelo Color AC Transmisión)))
  (cond
    ((null? valores) (error "Los valores de los atributos del automóvil deben ser especificados"))
    ((null? atributos) (error "Los atributos del automóvil deben ser especificados"))
    ((not (equal? (length valores) (length atributos))) (error "La cantidad de valores y atributos no coinciden"))
    (else (automovil-config valores atributos))
  )
)

(define (arbol-binario-nodo? nodo arbol elemento)
  ;(displayln arbol)
  (cond
    ((null? arbol) #f)
    ((equal? nodo elemento) #t)
    (else 
      (cond
        ((list? (car arbol))
          (cond
            ((> (length (car arbol)) 1) (arbol-binario-nodo? nodo (cons (cdar arbol) (cdr arbol)) (caar arbol)))
            (else (arbol-binario-nodo? nodo (append (car arbol) (cdr arbol)) (caar arbol)))
          )
        )
        (else (arbol-binario-nodo? nodo (cdr arbol) (car arbol)))
      )
    )
  )
)

#|
  Elimina el nodo especificado del árbol binario especificado
  @param nodo número real cómo nodo del árbol binario que se desea eliminar
  @param arbol árbol binario en formato de lista de números reale
  @return árbol binario en formato de lista de números reales sin el nodo especificado
|#
(define (arbol-binario-eliminar nodo arbol)
  (cond
    ((null? nodo) (error "Debe especificar el nodo del árbol binario que desea eliminar"))
    ((null? arbol) (error "El árbol binario debe contener al menos un elemento"))
    (else
      (cond
        ((arbol-binario-nodo? nodo arbol (car arbol)) (displayln "Eliminar nodo"))
        (else (error "El nodo especificado no es miembro del árbol especificado"))
      )
    )
  )
)

#|
  Cálcula la cantidad de elementos de la lista mediante recursión,
  se detiene cuándo la lista recibida esté vacía
  @param lista de datos
  @param longitud cantidad de elementos que tiene la lista
  @return número entero que representa la cantidad de elementos de la lista
|#
(define (longitud-cola-aux lista longitud)
  (cond
    ((null? lista) longitud)
    (else (longitud-cola-aux (cdr lista) (+ longitud 1)))
  )
)

#|
  Cálcula la cantidad de elementos de una lista mediante recursión de cola
  utilizando la función longitud-cola-aux cómo función auxiliar
  @param lista de datos
  @return número entero que representa la cantidad de elementos de la lista
|#
(define (longitud-cola lista)
  (cond
    ((null? lista) 0)
    (else (longitud-cola-aux lista 0))
  )
)

#|
  Cálcula la cantidad de elementos de una lista mediante recursión de pila,
  se detiene cuándo la lista recibida esté vacía
  @param lista de datos
  @return número entero que representa la cantidad de elementos de la lista
|#
(define (longitud-pila lista)
  (cond
    ((null? lista) 0)
    (else (+ (longitud-cola (cdr lista)) 1))
  )
)


; - - - - - Test - - - - -

(displayln "\n(factorial n)\n")
(factorial 0)
(factorial 1)
(factorial 7)

(displayln "\n\n(fibonacci n)\n")
(fibonacci 0)
(fibonacci 1)
(fibonacci 7)

(displayln "\n\n(miembro elemento lista)\n")
(miembro null '())
(miembro 'a '(a b c))
(miembro 'a '(b c d))

(displayln "\n\n(eliminar elemento lista)\n")
(eliminar 'a '(a))
(eliminar 'a '(a b c a))
(eliminar 'a '(b c d))

(displayln "\n\n(quicksort lista)\n")
(quicksort '(7 5))
(quicksort '(3 2 1))
(quicksort '(2 3 4 1 1 2 5))

(displayln "\n\n(automovil valores atributos)\n")
(automovil '(Hatchback Suzuki Forza1 Rojo Si Manual))
(automovil '(Hatchback Suzuki Forza2 Negro Si Automático))
(automovil '(Hatchback Suzuki Forza3 Azul No Manual) '(Tipo Marca Modelo Color AC Tansmisión))

(displayln "\n\n(arbol-binario-eliminar nodo arbol)\n")
(arbol-binario-eliminar 10 '(10 (5 3 8) (15 14 18)))
(arbol-binario-eliminar 3 '(10 (5 3 8) (15 14 18)))
(arbol-binario-eliminar 18 '(10 (5 3 8) (15 14 18)))

(displayln "\n\n(grafo-recorrer-anchura grafo)\n")

(displayln "\n\n(longitud-cola lista)\n")
(longitud-cola '())
(longitud-cola '(a b c))
(longitud-cola '(1 2 3 4 5))

(displayln "\n(longitud-pila lista)\n")
(longitud-pila '())
(longitud-pila '(a b c))
(longitud-pila '(1 2 3 4 5))

(displayln "")