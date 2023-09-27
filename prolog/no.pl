eixo(a,b).
eixo(a,c).
eixo(b,d).
eixo(c,d).
eixo(d,e).
eixo(f,g).

conectado(No,No).

conectado(No1,No2):- eixo(No1,Link),conectado(Link,No2).
conectado(No1,No2):- eixo(No2,Link),conectado(Link,No1).