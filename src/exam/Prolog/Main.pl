concat([], L, L).
concat([X | A], B, [X | C]):- concat(A, B, C).


concat_cut([], L, L):- !.
concat_cut([A | B], C, [A | D]):- concat_cut(B, C, D).