% famiglia

femmina(luisa).
femmina(carla).
femmina(maria).
femmina(anna).

madre(luisa,carla).
madre(carla,maria).
madre(carla,giovanni).
madre(maria,giorgio).

padre(nicola, luigi).
padre(luigi,maria).
padre(luigi,anna).
padre(luigi,giovanni).
padre(antonio,carla).

genitore(X,Y):- padre(X,Y).
genitore(X,Y):- madre(X,Y).

sorella(X,Y):- femmina(X), genitore(Z,X), genitore(Z,Y), dif(X,Y).

zia(A,B):- sorella(A,C), genitore(C,B).

nonno(X,Y):- padre(X,Z), genitore(Z,Y).

antenato(X,Y):- genitore(X,Y).
antenato(X,Y):- genitore(Z,Y), antenato(X,Z).



% somma

sum(0,X,X).
sum(s(X),Y,s(Z)):- sum(X,Y,Z).