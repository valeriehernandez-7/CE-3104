% Valerie M. Hernández Fernández
% valeriehernandez@estudiantec.cr
% https://github.com/valeriehernandez-7

% Programación Lógica
% Taller

% Instituto Tecnológico de Costa Rica
% Campus Tecnológico Central Cartago
% Área Académica Ingeniería en Computadores

% CE 3104 Lenguajes, Compiladores e Intérpretes
% Ing. Marco Rivera Meneses, MGP
% Grupo 01

% I Semestre
% 2023



% >>>>>>>>>>>>>>> Árbol Genealógico  <<<<<<<<<<<<<<<

% A es el progenitor de B
% progenitor(A, B).
progenitor(clara, jose).
progenitor(tomas, jose).
progenitor(tomas, isabel).
progenitor(jose, ana).
progenitor(jose, patricia).
progenitor(patricia, jaime).

% A es el antecesor de B
antecesor(A, B) :- progenitor(A, B).
antecesor(A, B) :- progenitor(A, C), progenitor(C, B).

% A es el sucesor de B
sucesor(A, B) :- progenitor(B, A).
sucesor(A, B) :- progenitor(B, C), progenitor(A, C).

% ¿Como preguntamos quienes son los abuelos de Jaime?
% R/: ?- progenitor(Abuelo, Madre), progenitor(Madre, jaime).

% ¿Como preguntamos quienes son los bisabuelos de Jaime?
% R/: ?- progenitor(Bisabuela, Abuelo), progenitor(Bisabuelo, Abuelo), progenitor(Abuelo, Madre), progenitor(Madre, jaime), Bisabuela \= Bisabuelo.



% >>>>>>>>>>>>>>> Hechos <<<<<<<<<<<<<<<

valioso(oro). % El oro es valioso
mujer(ana). % Ana es mujer
tiene(juan, oro). % Juan tiene oro
padre(juan, maria). % Juan es el padre de María
presta(juan, libro, maria). % Juan presta el libro a María
presta(juan, lapiz, pedro). % Juan presta el lápiz a Pedro
presta(pedro, borrador, juan). % Pedro presta el borrador a Juan



% >>>>>>>>>>>>>>> Herman[a/o] <<<<<<<<<<<<<<<

hombre(albert). % Albert es hombre
hombre(edward). % Edward es hombre
mujer(alice). % Alice es mujer
mujer(victoria). % Victoria es mujer
padres(edward, victoria, albert). % Victoria y Albert son los padres de Edward || Victoria es madre de Edward y Albert es padre de Edward
padres(alice, victoria, albert). % Victoria y Albert son los padres de Alice || Victoria es madre de Alice y Albert es padre de Alice

% A es hermana de B
hermana_de(A, B) :-
    mujer(A), % + A es mujer
    padres(A, C, D), % + C y D son los padres de A
    padres(B, C, D), % + C y D son los padres de B
    A \= B. % + A diferente de B

% A es hermano de B
hermano_de(A, B) :-
    hombre(A), % + A es hombre
    padres(A, C, D), % + C y D son los padres de A
    padres(B, C, D), % + C y D son los padres de B
    A \= B. % + A diferente de B



% >>>>>>>>>>>>>>> Miembro <<<<<<<<<<<<<<<

% Elemento es miembro de la Lista si el primer elemento de la lista es el elemento recibido
miembro(Elemento, [Elemento | _]).
miembro(Elemento, [_ | Lista]) :- miembro(Elemento, Lista).



% >>>>>>>>>>>>>>> Inversa <<<<<<<<<<<<<<<

% Invierte el orden de los elementos en una lista o verifica que la lista L1 sea la lista inversa de L y viceversa
inversa(L1, L) :- inversa(L1, [], L).
inversa([], L, L).
inversa([Elemento | L1], L2, L3) :- inversa(L1, [Elemento | L2], L3).



% >>>>>>>>>>>>>>> Longitud <<<<<<<<<<<<<<<

% Indica la longitud de un lista o verifica que longitud de la lista sea la ingresada en longitud(lista, longitud)
longitud([], 0).
longitud([_ | Lista], Longitud) :-
    longitud(Lista, Contador),
    Longitud is Contador + 1.



% >>>>>>>>>>>>>>> Acontecimientos <<<<<<<<<<<<<<<

% Eventos obtenidos de https://www.nationalgeographic.com.es/ciencia/breve-historia-visual-inteligencia-artificial_14419

acontecimiento(1854, 'George Boole, matem\u00E1tico argumenta por primera vez en la historia que el razonamiento l\u00F3gico podr\u00EDa sistematizarse de la misma manera que se resuelve un sistema de ecuaciones.').
acontecimiento(1936, 'Alan Turing, padre de la computaci\u00F3n moderna, publica su art\u00EDculo sobre los n\u00FAmeros computables en el que introduce el concepto de algoritmo y sienta las bases de la inform\u00E1tica.').
acontecimiento(1956, 'John McCarthy, inform\u00E1tico acu\u00F1a por primera vez el t\u00E9rmino Inteligencia Artificial durante la conferencia de Darmouth de 1956, considerada el germen de la disciplina.').
acontecimiento(1979, 'el Cart de Stanforf hace su primer recorrido. Este veh\u00EDculo, uno de los primeros veh\u00EDculos aut\u00F3nomos de la historia se convirti\u00F3 en el primero de recorrer con \u00E9xito un espacio ocupado por obst\u00E1culos de forma aut\u00F3noma.').
acontecimiento(2012, 'Google crea un superordenador capaz de aprender a trav\u00E9s de YouTube a identificar gatos as\u00ED como caras y cuerpos humanos.').

fechaEvento() :-
    writeln('Digite el a\u00F1o del acontecimiento'),
    read(Fecha),
    write('En el a\u00F1o '),
    write(Fecha),
    write(', '),
    acontecimiento(Fecha, Evento),
    writeln(Evento).