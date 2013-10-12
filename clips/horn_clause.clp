%Si puo’dare significato intuitivo ai predicati che compaiono nella base di conoscenza sapendo che:
%F rappresenta Father, M Mother, P parent, MA sta per male e FE per female, HC per HasChild, S per sibling, A per ancestor e H %per Human.

%Nelle formule seguenti si assume che x, y e z siano variabili  quantificate universalmente, mentre P1–P10 siano costanti  

A(x,y)  S(y,x)
P(x,y)  A(x,y)
P(x,z) and A(z,y)  A(x,y) 
F(x,y)    P(x,y)
M(x,y)  P(x,y)
HC(x,y)  and H(x) and MA(x) and H(y)  F(x,y)
HC(x,y)  and H(x) and FE(x)  and H(y)   M(x,y)

H(P1)   	MA(P2)
H(P2)		MA(P3)
H(P3)		MA(P6)
H(P4)		MA(P7)
H(P5)		MA(P9)
H(P6)		FE(P1)
H(P7)		FE(P4)
H(P8)		FE(P5)
H(P9)              FE(P8)
H(P10)		FE(P10)

HC(P1,P3)       HC(P1,P4)     HC(P5,P7)   HC(P5,P10)  
HC(P4,P8)   HC(P4,P9)  HC( P6,P2)  HC(P7,P8)	HC(P7,P9)   
HC(P10,P6)    