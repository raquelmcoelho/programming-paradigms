lista([]).
lista([_|Y]):-lista(Y).

membro(X,[X|_]).
membro(X,[_|Y]):-membro(X,Y).

prefixo([],_).
prefixo([X|Xs],[X|Ys]):-prefixo(Xs,Ys).
prefixo([X|Xs],[X|Ys]):-prefixo(Ys,Xs).

sufixo(Xs,Xs).
sufixo(Xs,[_|Ys]):-sufixo(Xs,Ys).

sublista(Xs,Ys):-prefixo(Ps,Ys),sufixo(Xs,Ps).
sublista(Xs,Ys):-prefixo(Xs,Ps),sufixo(Ps,Ys).
