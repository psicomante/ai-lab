full_adder(X,Y,Cin,S,Cout):-
	and(X,Cin,U1),
	xor(X,Cin,U3),
	and(U3,Y,U2),
	xor(U3,Y,S),
	or(U1,U2,Cout).

and(0,0,0).
and(0,1,0).
and(1,0,0).
and(1,1,1).

or(0,0,0).
or(0,1,1).
or(1,0,1).
or(1,1,1).

xor(0,0,0).
xor(0,1,1).
xor(1,0,1).
xor(1,1,0).

