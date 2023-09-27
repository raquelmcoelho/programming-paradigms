%programa em prolog

% o mundo é composto de fatos

% Base de conhecimento : família

% fatos sobre homens

homem(anacleto).
homem(artur).
homem(nero).
homem(ermenegildo).
homem(zeca).
homem(tammis).


% ... mulheres
mulher(eneida).
mulher(gilsa).
mulher(marilia).

%pais 

pai(anacleto,artur).
pai(anacleto,nero).
pai(artur,gilsa).
pai(nero,tammis).
pai(artur,eneida).

% mãe
mae(eneida,marilia).

% definicao de avo
avo(X,Y):- pai(X,Z),pai(Z,Y).
avo(X,Y):- pai(X,Z),mae(Z,Y).

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
