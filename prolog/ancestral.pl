%programa em prolog

% o mundo é composto de fatos

% Base de conhecimento : família

% fatos sobre homens

homem(yuri).
homem(leo).
homem(joao).
homem(coutinho).
homem(ronaldo).

% ... mulheres
mulher(raquel).
mulher(cellbit).

%pais 
pai(yuri,leo).
pai(yuri,joao).
pai(leo, cellbit).
pai(leo,raquel).
pai(coutinho,ronaldo).

% mãe
mae(raquel,coutinho).

% definicao de avo
avo(X,Y):- pai(X,Z),pai(Z,Y).
avo(X,Y):- pai(X,Z),mae(Z,Y).
bisavo(X,Y):- pai(X,Z),avo(Z,Y).
trisavo(X,Y):- pai(X,Z),bisavo(Z,Y).

ancestral(X,Y):- pai(X,Y).
ancestral(X,Y):- mae(X,Y).
ancestral(X,Y):- pai(X,Z),ancestral(Z,Y).
ancestral(X,Y):- mae(X,Z),ancestral(Z,Y).

%ancestral(ronaldo, yuri).
% definicao de irmão
%irmao(X,Y):- pai(Z,Y),pai(Z,X).
%irmao(X,Y):- mae(Z,Y),mae(Z,X).

%Correção na definição de irmao
irmao(X,Y):- pai(Z,Y),pai(Z,X),X \== Y.
irmao(X,Y):- mae(Z,Y),mae(Z,X),X \== Y.

%definição de filho

filho(X,Y):-pai(Y,X),homem(X).
filha(X,Y):-pai(Y,X),mulher(X).

%definição de tio
tio(T,S):-irmao(T,P),pai(P,S).

%definição de primos
primos(P1,P2):- pai(PA1,P1), pai(PA2,P2),irmao(PA1,PA2).
