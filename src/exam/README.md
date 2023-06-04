# CE3104 - Exam

<br>

## Racket

### Problem

_Bubble Sort_

### Solution

[Bubble Sort](https://github.com/valeriehernandez-7/CE-3104/tree/main/src/exam/Racket)

### Test

```racket
> (bubble '(126 43 26 1 113))
'(1 26 43 113 126)

> (bubble '(2000 5 7))
'(5 7 2000)

> (bubble '(7))
'(7)
```

## Prolog

### Problem

_Concatenate_

### Solution

[Concatenate](https://github.com/valeriehernandez-7/CE-3104/tree/main/src/exam/Prolog)

### Test

```prolog
?- concat([a,b,c], [d,e], [a,b,c,d,e]).
true.

?- concat(L, [d,e], [a,b,c,d,e]).
L = [a,b,c].

?- concat([a,b,c], L, [a,b,c,d,e]).
L = [d,e].

?- concat([a,b,c], [d,e], L).
L = [a,b,c,d,e].


?- concat_cut([a,b,c], [d,e], [a,b,c,d,e]).
true.

?- concat_cut(L, [d,e], [a,b,c,d,e]).
L = [a,b,c].

?- concat_cut([a,b,c], L, [a,b,c,d,e]).
L = [d,e].

?- concat_cut([a,b,c], [d,e], L).
L = [a,b,c,d,e].
```

## C

### Problem

_Perfect Numbers_

### Solution

[Perfect Numbers](https://github.com/valeriehernandez-7/CE-3104/tree/main/src/exam/C)

### Test

```c
Perfect numbers from 1 to 10 are:
6

Perfect numbers from 1 to 100 are:
6 28

Perfect numbers from 1 to 1000 are:
6 28 496

Perfect numbers from 1 to 10000 are:
6 28 496 8128 
```

## Java

### Problem

_Sports_

### Solution

[Sports](https://github.com/valeriehernandez-7/CE-3104/tree/main/src/exam/Java)

### Test

```java
Saprissa
	Sport : Soccer
	Positions : Goalkeepers : 2, Defenders : 3

Saprissa
	Sport : Basketball
	Positions : Wings : 5, Posts : 2

Saprissa
	Sport : Volleyball
	Positions : Hitters : 6, Setters : 4
```

##

### Student

[Valerie M. Hernández Fernández](https://github.com/valeriehernandez-7)

### University

[Costa Rica Institute of Technology](https://www.tec.ac.cr/)

### Site

[Cartago Central Technology Campus](https://www.tec.ac.cr/ubicaciones/campus-tecnologico-central-cartago)

### Degree

[Computer Engineering](https://www.tec.ac.cr/en/carreras/licentiates-degree-computer-engineering)

### Course

[CE3104 - Languages, Compilers and Interpreters](https://www.tec.ac.cr/planes-estudio/licenciatura-ingenieria-computadores)

### Assignment

Exam

### Semester

I 2023
