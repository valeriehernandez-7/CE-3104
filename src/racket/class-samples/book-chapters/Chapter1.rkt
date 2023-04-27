#lang racket

#|
  https://docs.racket-lang.org/reference/generic-numbers.html#%28part._.Arithmetic%29
  https://docs.racket-lang.org/reference/generic-numbers.html#%28part._.Number_.Comparison%29
  
|#

(display "\nEjercicio N° 1\n") ; Chapter 1 - Pag 37 (pdf 20)

(/ 1 3) ; procedure = 1/3 && output = 1/3
(- 10 (- 8 (- 6 4))) ; procedure = (10-(8-(6-4))) && output = 4
(/ 40 (* 6 15)) ; procedure = (40/(6*15)) && output = 4/9
(+ (* 0.1 20) (/ 4 3)) ; procedure = ((0.1*20)+(4/3)) && output = 3.333333333333333 == 10/3
(+ (/ 1 3) (/ 2 3)) ; procedure = ((1/3)+(2/3)) && output = 1


(display "\nEjercicio N° 2\n") ; Chapter 1 - Pag 37 (pdf 20)

(- (* 4 7) (+ 20 2)) ; procedure = ((4*7)-(20+2)) && output = 6
(* 3 (+ 4 -5 -2)) ; procedure = ((3*(4+-5+-2))) && output = -9
(/ 2.5 (* 5 (/ 1 10))) ; procedure = (2.5/(5*(1/10))) && output = 5
(+ (/ 1 3) (/ 4 5) (* 65 (/ 18 2)) 21) ; procedure = ((1/3)+(4/5)+(65*(18/2))+21) && output = 607.1333333 == 9107/15
(- (* 5 42 (/ 23 2) (+ 12 2)) (* 2 (/ 18 3))) ; procedure = ((5*42*(23/2)*(12+2))-(2*(18/3)) && output = 33798


(display "\nEjercicio N° 3\n") ; Chapter 1 - Pag 37 (pdf 20)

(define-values (a b c) (values 15 10 5)) ; a = 15 , b = 10 , c = 5
(+ a (- (+ b c) a)) ; (a+((b+c)-a))
(+ (* a b) (* b c)) ; ((a*b)+(b*c))
(/ (- a b) (- a c)) ; ((a-b)/(a-c))
(* (+ a b c) (- a b c) (/ a b c)) ; ((a+b+c)*(a-b-c)*(a/b/c))
(/ (* a b) (* b c) (* a c)) ; ((a*b)/(b*c)/(a*c))


(display "\nEjercicio N° 4\n") ; Chapter 1 - Pag 38 (pdf 21)

(min 0 (abs (- 8 7)) (abs (- 7 8))) ; output = 0
(min (max 0 1 2 1) (max 7 5 4 2)) ; output = 2
(truncate (round 7.33)) ; output = 7.0
(round (abs (* 2.11 3.18))) ; output = 7.0
(abs (- (quotient 19 3) (remainder 19 3))) ; output = 5 -- NOTE : Dividend / Divisor = Quotient  
(* 3 (remainder 11 -2)) ; output = 3
(* 3 (modulo 11 -2)) ; output = -3


(display "\nEjercicio N° 5\n") ; Chapter 1 - Pag 38 (pdf 21)

;(zero? (- 7 7) (* 0 2)) ; output = error: the expected number of arguments does not match the given number
(zero? (- 7 6.99)) ; output = #f -> (- 7 6.99) : 0.009999999999999787
(= (* 2 3 5) (* 15 2)) ; output = #t
(= (/ 1 3) 1.333) ; output = #f
(= (/ 1 3) (- 1 (/ 2 3))) ; output = #t
(equal? #t #t) ; output = #t
(equal? (> 8 7) (>= 6 6)) ; output = #t
(and (<= 2 3) (<= 10 12) (<= 20 21)) ; output = #t
(or (> 2 3) (< 10 12) (> 20 21)) ; output = #t


(display "\nEjercicio N° 6\n") ; Chapter 1 - Pag 38 (pdf 21)

(define d 5)
(quote d) ; output = 'd
'd ; output = 'd
d ; output = 5
(+ 5 d) ; output = 10
(define e 7) ; output = 10
(+ 5 e) ; output = 12
(cond
  ((= e 0) 0)
  ((> e 0) -1) ; returns
  ((> e 0) 1)
 )

(define (test n)
  (cond
    ((= n 0) 0)
    ((< n 0) -1)
    ((> n 0) 1)
  )
)
(test -3) ; output = -1
(test 0) ; output = 0
(test 3) ; output = 1
(test e) ; output = 1


(display "\nEjercicio N° 7\n") ; Chapter 1 - Pag 39 (pdf 22)

(let (
    (a (+ 2 4)) ; a = 6 -> (2+4)
    (b (+ 7 1)) ; b = 8 -> (7+1)
    (c (+ 7 7)) ; c = 14 -> (7+7)
  )
  (+ a b c) ; output = 28 -> (6+8+14)
)

(let* (
    (a (+ 2 4)) ; a = 6 -> (2+4)
    (b (+ 7 1)) ; b = 8 -> (7+1)
    (c (+ 7 7)) ; c = 14 -> (7+7)
  )
  (+ a b c) ; output = 28 -> (6+8+14)
)

(let (
    (a (+ 2 4)) ; a = 6 -> (2+4)
    (b (+ 7 a)) ; b = 22 -> (7+15)
    (c (+ 7 a)) ; c = 22 -> (7+15)
  )
  (+ a b c) ; output = 50 -> (6+22+22)
)

(let* (
    (a (+ 2 4)) ; a = 6 -> (2+4)
    (b (+ 7 a)) ; b = 13 -> (7+6)
    (c (+ 7 a)) ; c = 13 -> (7+6)
  )
  (+ a b c) ; output = 32 -> (6+13+13)
)


(display "\nEjercicio N° 8\n") ; Chapter 1 - Pag 40 (pdf 23)

(quote (1 2)) ; output = '(1 2) -- ref = https://docs.racket-lang.org/reference/quote.html#%28form._%28%28quote._~23~25kernel%29._quote%29%29
;(eval '(+ 1 2)) ; output = 3 -> (1+2) -- ref = https://docs.racket-lang.org/reference/eval.html#%28def._%28%28quote._~23~25kernel%29._eval%29%29
(apply + '(1 2)) ; output = 3 -> (1+2) -- ref = https://docs.racket-lang.org/reference/procedures.html#%28def._%28%28lib._racket%2Fprivate%2Fbase..rkt%29._apply%29%29


(display "\nEjercicio N° 9\n") ; Chapter 1 - Pag 40 (pdf 23)

((lambda (x y) (+ x y)) 2 3) ; output = 5
((lambda (x y) (+ x y)) 4 5) ; output = 9

(define suma-a
  (lambda (x y) (+ x y))
)
(suma-a 2 3) ; output = 5
(suma-a 4 5) ; output = 9

(define (suma-b x y)
  (+ x y)
)
(suma-b 2 3) ; output = 5
(suma-b 4 5) ; output = 9

(apply (lambda (x y) (+ x y)) '(2 3)) ; output = 5
(apply + '(1)) ; output = 1
(apply + '(1 2 3)) ; output = 6
(apply abs '(1)) ; output = 1
;(apply abs '(-1 1)) ; output = error: the expected number of arguments does not match the given number