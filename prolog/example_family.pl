% Family Example for Prolog
% nomi minuscoli (maiuscoli sono le variabili)
% predicati??

female(louise).
female(jennifer).
female(mary).
female(anne).

mother(louise,jennifer).
mother(jennifer,mary).
mother(jennifer,john).
mother(mary,george).

father(nicola, luigi).
father(luigi,mary).
father(luigi,anne).
father(luigi,john).
father(antonio,jennifer).

parent(X,Y):- father(X,Y).
parent(X,Y):- mother(X,Y).

sister(X,Y):- female(X), parent(Z,X), parent(Z,Y), dif(X,Y).

aunt(A,B):- sister(A,C), parent(C,B).

grandfather(X,Y):- father(X,Z), parent(Z,Y).

relative(X,Y):- parent(X,Y).