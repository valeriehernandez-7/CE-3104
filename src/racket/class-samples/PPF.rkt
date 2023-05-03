#lang racket


#|
  Valerie M. Hernández Fernández
  valeriehernandez@estudiantec.cr
  https://github.com/valeriehernandez-7

  Programación Funcional
  Taller

  Instituto Tecnológico de Costa Rica
  Campus Tecnológico Central Cartago
  Área Académica Ingeniería en Computadores

  CE 3104 Lenguajes, Compiladores e Intérpretes
  Ing. Marco Rivera Meneses, MGP
  Grupo 01

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
  3. (miembro? elemento lista)
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
      7.1. > (arbol-binario-eliminar '5 '(10 5 15))
      7.2. > (arbol-binario-eliminar '15 '(10 (5 2 8) (15 17)))
      7.3. > (arbol-binario-eliminar '18 '(10 (5 (2 1 3) (8 7 9)) (15 (14 13 15) (17 16 18))))
  8. (grafo-busqueda-anchura grafo nodo)
      8.1. > (grafo-busqueda-anchura '((A (B D)) (B (A C)) (C (B D)) (D (A C))) 'C)
      8.2. > (grafo-busqueda-anchura '((I (A B)) (A (I C D)) (B (I C D)) (C (A B E)) (D (A B F)) (E (C)) (F (D))))
      8.3. > (grafo-busqueda-anchura '((A (H)) (B (D H)) (C (D R)) (D (B C H)) (H (A B D R T)) (R (C H)) (T (H))) 'D)
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
  Obtiene la unión de los elementos que pertenecen al conjunto A y al conjunto B
  @param a conjunto A en A ∪ B
  @param b conjunto B en A ∪ B
  @return lista de elementos en el conjunto unión
|#
(define (conjuntos-union (a '()) (b '()))
  (remove-duplicates (append a b))
)

#|
  Obtiene los elementos que pertenecen al conjunto A y al conjunto B
  @param a conjunto A en A ∩ B
  @param b conjunto B en A ∩ B
  @param interseccion lista de elementos cómo conjunto intersección
  @return lista de elementos en el conjunto intersección
|#
(define (conjuntos-interseccion (a '()) (b '()) (interseccion '()))
  (cond 
    ((null? a) interseccion)
    (else
      (cond
        ((member (car a) b) (conjuntos-interseccion (cdr a) b (append interseccion (list (car a)))))
        (else (conjuntos-interseccion (cdr a) b interseccion))
      )
    )
  )
)

#|
  Obtiene los elementos del conjunto A que no pertenecen al conjunto B
  @param a conjunto A en A \ B
  @param b conjunto B en A \ B
  @param diferencia lista de elementos cómo conjunto diferencia
  @return lista de elementos en el conjunto diferencia
|#
(define (conjuntos-diferencia (a '()) (b '()) (diferencia '()))
  (cond 
    ((null? a) diferencia)
    (else
      (cond
        ((not (member (car a) b)) (conjuntos-diferencia (cdr a) b (append diferencia (list (car a)))))
        (else (conjuntos-diferencia (cdr a) b diferencia))
      )
    )
  )
)

#|
  Obtiene los elementos del conjunto A que no pertenecen al conjunto B
  y los elementos del conjunto B que no pertenecen al conjunto A
  @param a conjunto A en A Δ B
  @param b conjunto B en A Δ B
  @return lista de elementos en el conjunto diferencia simétrica
|#
(define (conjuntos-diferencia-simetrica (a '()) (b '()))
  (append (conjuntos-diferencia a b) (conjuntos-diferencia b a))
)

#|
  Obtiene los elementos del conjunto Universo que no pertenecen al conjunto A
  @param a conjunto A
  @param universo conjunto Universo
  @return lista de elementos en el conjunto complemento de A
|#
(define (conjuntos-complemento (a '()) (universo '()))
  (conjuntos-diferencia universo a)
)


#|
  Invierte el orden de la lista
  @param lista lista de elementos que desea invertir
  @param invertida lista con el orden recibido invertido
  @return lista con los elementos en orden inverso
|#
(define (invertir lista (invertida '()))
  (cond
    ((null? lista) invertida)
    (else (invertir (cdr lista) (cons (car lista) invertida)))
  )
)


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
(define (miembro? elemento lista)
  (cond
    ((null? lista) #f)
    ((equal? elemento (car lista)) #t)
    (else (miembro? elemento (cdr lista)))
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
  @return lista de pares o displayln según el cumplimiento de condiciones
|#
(define (automovil valores (atributos '(Tipo Marca Modelo Color AC Transmisión)))
  (cond
    ((null? valores) (displayln "ERROR: Los valores de los atributos del automóvil deben ser especificados"))
    ((null? atributos) (displayln "ERROR: Los atributos del automóvil deben ser especificados"))
    ((not (equal? (length valores) (length atributos))) (displayln "ERROR: La cantidad de valores y atributos no coinciden"))
    (else (automovil-config valores atributos))
  )
)

(define (arbol-binario raiz hijo-izq hijo-der)
  (cond
    ((null? raiz) '())
    (else
      (cond
        ((and (null? hijo-izq) (null? hijo-der)) (list raiz))
        (else (list raiz hijo-izq hijo-der))
      )
    )
  )
)

(define (arbol-binario-raiz arbol)
  (cond
    ((null? arbol) '())
    ((list? arbol) (first arbol))
    (else arbol)
  )
)

(define (arbol-binario-hijo-izq arbol)
  (cond
    ((list? arbol)
      (cond
        ((list? (second arbol))
          (cond
            ((null? (second arbol)) '())
            (else (caadr arbol))
          )
        )
        (else (second arbol))
      )
    )
    (else '())
  )
)

(define (arbol-binario-hijo-izq? nodo arbol)
  (equal? nodo (arbol-binario-hijo-izq arbol))
)

(define (arbol-binario-hijo-der arbol)
  (cond
    ((list? arbol)
      (cond
        ((list? (third arbol)) 
          (cond
            ((null? (third arbol)) '())
            (else (caaddr arbol))
          )
        )
        (else (third arbol))
      )
    )
    (else '())
  )
)

(define (arbol-binario-hijo-der? nodo arbol)
  (equal? nodo (arbol-binario-hijo-der arbol))
)

(define (arbol-binario-subarbol-izq arbol)
  (cond
    ((list? arbol) (second arbol))
    (else '())
  )
)

(define (arbol-binario-subarbol-der arbol)
  (cond
    ((list? arbol) (third arbol))
    (else '())
  )
)

(define (arbol-binario-mayor arbol)
  (cond 
    ((null? arbol) '())
    ((null? (arbol-binario-subarbol-der arbol)) (arbol-binario-raiz arbol))
    (else (arbol-binario-mayor (arbol-binario-subarbol-der arbol)))
  )
)

(define (arbol-binario-nodo? nodo arbol (raiz (arbol-binario-raiz arbol)))
  (cond
    ((null? arbol) #f)
    ((equal? nodo raiz) #t)
    (else
      (cond
        ((< nodo raiz) (arbol-binario-nodo? nodo (arbol-binario-subarbol-izq arbol)))
        (else (arbol-binario-nodo? nodo (arbol-binario-subarbol-der arbol)))
      )
    )
  )
)

(define (arbol-binario-hoja? nodo arbol (raiz (arbol-binario-raiz arbol)))
  (cond
    ((null? arbol) #f)
    ((equal? nodo raiz) (and (null? (arbol-binario-subarbol-izq arbol)) (null? (arbol-binario-subarbol-der arbol))))
    (else
      (cond
        ((< nodo raiz) (arbol-binario-hoja? nodo (arbol-binario-subarbol-izq arbol)))
        (else (arbol-binario-hoja? nodo (arbol-binario-subarbol-der arbol)))
      )
    )
  )
)


(define (arbol-binario-subarbol nodo arbol)
  (cond
    ((null? arbol) '())
    ((or (equal? nodo (arbol-binario-hijo-izq arbol)) (equal? nodo (arbol-binario-hijo-der arbol))) arbol)
    (else
      (cond
        ((< nodo (arbol-binario-raiz arbol)) (arbol-binario-subarbol nodo (arbol-binario-subarbol-izq arbol)))
        (else (arbol-binario-subarbol nodo (arbol-binario-subarbol-der arbol)))
      )
    )
  )
)

; (arbol-binario-eliminar '8 '(10 (5 (2 1 3) (8 7 9)) (15 (12 11 13) (17 16 18))))
; (arbol-binario-eliminar '12 '(10 (5 (2 1 3) (8 7 9)) (15 (12 11 ()) (17 16 18))))
; (arbol-binario-eliminar '17 '(10 (5 (2 1 3) (8 7 9)) (15 (12 11 13) (17 () 18))))

(define (arbol-binario-eliminar-aux nodo arbol (raiz (arbol-binario-raiz arbol)))
  (cond
    ((null? arbol) '())
    ((< nodo raiz)
      (arbol-binario 
        raiz
        (arbol-binario-eliminar-aux nodo (arbol-binario-subarbol-izq arbol))
        (arbol-binario-subarbol-der arbol)
      )
    )
    ((> nodo raiz)
      (arbol-binario 
        raiz
        (arbol-binario-subarbol-izq arbol)
        (arbol-binario-eliminar-aux nodo (arbol-binario-subarbol-der arbol))
      )
    )
    ((arbol-binario-hoja? nodo arbol) '())
    ((null? (arbol-binario-hijo-izq arbol)) (arbol-binario-subarbol-der arbol))
    ((null? (arbol-binario-hijo-der arbol)) (arbol-binario-subarbol-izq arbol))
    (else
      (arbol-binario
        (arbol-binario-mayor (arbol-binario-subarbol-izq arbol))
        (arbol-binario-eliminar-aux
          (arbol-binario-mayor (arbol-binario-subarbol-izq arbol))
          (arbol-binario-subarbol-izq arbol)
        )
        (arbol-binario-subarbol-der arbol)
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
    ((null? nodo) (displayln "ERROR: Debe especificar el nodo del árbol binario que desea eliminar"))
    ((null? arbol) (displayln "ERROR: El árbol binario debe contener al menos un elemento"))
    (else
      (cond
        ((arbol-binario-nodo? nodo arbol) (arbol-binario-eliminar-aux nodo arbol))
        (else
          (display "ERROR: ")
          (display nodo)
          (display " no es un nodo del árbol binario ")
          (displayln arbol)
        )
      )
    )
  )
)



#|
  Verifica que el grofo especificado tenga la forma ((n_1 (a_1 a_n)) (n_n (a_1 a_n)))
  @param grofo lista multidimensional de datos cómo grafo
  @return booleano (falso : el grafo tiene fallo de formato , true : el grafo sigue el formato)
|#
(define (grafo-valido? grafo)
  (cond
    ((null? grafo) #t)
    ((not (list? (car grafo))) #f)
    ((not (equal? (length (car grafo)) 2)) #f)
    ((list? (caar grafo)) #f)
    ((not (list? (cadar grafo))) #f)
    ((< (length (cadar grafo)) 1) #f)
    (else (grafo-valido? (cdr grafo)))
  )
)

#|
  Verifica si el nodo pertenece al grafo
  @param nodo valor del nodo que desea verificar pertencia
  @param grafo grafo que desea recorrer
  @return booleano (falso : el nodo no pertenece al grafo, true : el nodo si pertenece al grafo)
|#
(define (grafo-nodo? nodo grafo)
  (cond
    ((null? grafo) #f)
    ((equal? nodo (caar grafo)) #t)
    (else (grafo-nodo? nodo (cdr grafo)))
  )
)

#|
  Obtiene los vecinos inmediatos de un nodo de un grafo
  @param nodo nodo del cual se desea obtener los vecinos inmediatos
  @param grafo grafo en el que se desea buscar los vecinos inmediatos del nodo especificado
  @param vecinos lista de nodos vecinos inmediatos del nodo especificado
  @return lista de nodos vecinos inmediatos del nodo especificado
|#
(define (grafo-vecinos nodo grafo (vecinos '()))
  (cond 
    ((null? grafo) vecinos)
    (else
      (cond
        ((equal? nodo (caar grafo)) (append vecinos (cadar grafo)))
        (else (grafo-vecinos nodo (cdr grafo) vecinos))
      )
    )
  )
)

#|
  Aplica el algorimo de Búsqueda en Amplitud (BFS) de manera recursiva al grafo recibido
  @param grafo grafo no dirigido con la forma ((n_1 (a_1 a_n)) (n_n (a_1 a_n)))
  @param cola lista de nodos por visitar del grafo, inicia con el nodo de referencia cómo primer elemento
  @param ruta lista de nodos visitados del grafo
  @return lista de nodos visitados en el orden BFS
|#
(define (grafo-extender grafo (cola '()) (ruta '()))
  ;(display cola) (display "\t\t\t") (displayln ruta)
  (cond 
    ((null? cola) ruta)
    (else
      (cond
        ((not (member (car cola) ruta))
          (grafo-extender 
            grafo 
            (append (cdr cola) (conjuntos-diferencia (conjuntos-diferencia (grafo-vecinos (car cola) grafo) ruta) cola))
            (append ruta (list (car cola)))
          )
        )
        (else (grafo-extender grafo (cdr cola) ruta))
      )
    )
  )
)

#|
  Verifica la validez de los parámetros y luego envía los datos a la función grafo-extender
  para que sea aplicado el algoritmo BFS al grafo especificado
  @param grafo grafo no dirigido con la forma ((n_1 (a_1 a_n)) (n_n (a_1 a_n)))
  @param nodo nodo de referencia para el recorrido BFS, si no se especifica la función toma el primer nodo cómo referente
  @return lista de nodos visitados en el orden BFS
|#
(define (grafo-busqueda-anchura grafo (nodo (caar grafo)))
  (cond
    ((or (null? grafo) (not (grafo-valido? grafo))) (displayln "ERROR: Grafo no válido"))
    ((null? nodo) (displayln "ERROR: Nodo inicial de recorrido debe ser especificado"))
    ((not (grafo-nodo? nodo grafo))
      (display "ERROR: ")
      (display nodo)
      (display " no es un nodo del grafo ")
      (displayln grafo)
    )
    (else (grafo-extender grafo (list nodo)))
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

(displayln "\n\n(miembro? elemento lista)\n")
(miembro? null '())
(miembro? 'a '(a b c))
(miembro? 'a '(b c d))

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
(arbol-binario-eliminar '8 '(10 (5 (2 1 3) (8 7 9)) (15 (12 11 13) (17 16 18))))
(arbol-binario-eliminar '12 '(10 (5 (2 1 3) (8 7 9)) (15 12 (17 16 18))))
(arbol-binario-eliminar '17 '(10 (5 (2 1 3) (8 7 9)) (15 (12 11 13) 17)))
(arbol-binario-eliminar '12 '(10 (5 (2 1 3) (8 7 9)) (15 (12 11 ()) (17 16 18))))
(arbol-binario-eliminar '17 '(10 (5 (2 1 3) (8 7 9)) (15 (12 11 13) (17 () 18))))
(arbol-binario-eliminar '15 '(10 (5 (2 1 3) (8 7 9)) (15 (12 11 13) (17 16 18))))
(arbol-binario-eliminar '10 '(10 (5 (2 1 3) (8 7 9)) (15 (12 11 13) (17 16 18))))

(displayln "\n\n(grafo-busqueda-anchura grafo nodo)\n")
(grafo-busqueda-anchura '((A (B D)) (B (A C)) (C (B D)) (D (A C))) 'C)
(grafo-busqueda-anchura '((I (A B)) (A (I C D)) (B (I C D)) (C (A B E)) (D (A B F)) (E (C)) (F (D))))
(grafo-busqueda-anchura '((A (H)) (B (D H)) (C (D R)) (D (B C H)) (H (A B D R T)) (R (C H)) (T (H))) 'D)

(displayln "\n\n(longitud-cola lista)\n")
(longitud-cola '())
(longitud-cola '(a b c))
(longitud-cola '(1 2 3 4 5))

(displayln "\n(longitud-pila lista)\n")
(longitud-pila '())
(longitud-pila '(a b c))
(longitud-pila '(1 2 3 4 5))