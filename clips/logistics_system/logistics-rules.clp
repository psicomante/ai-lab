; a number of planes placed in a number of airports; these planes need to be moved in other airports

(defrule LOAD

	(plane ?p)
	(airport ?a)
	(cargo ?c)
	(at ?p ?a)
	?f1 <- (is-in ?c ?a)
	?f2 <- (empty ?p)			; same as above
	=>
		(printout t " Plane " ?p " has loaded cargo " ?c " at airport" ?a crlf)
		(assert (loaded ?c ?p))
		(retract ?f1)
		(retract ?f2)
)

;move(P,Source,Dest)
;IF plane(P)  and  airport(Source) and  airport(Dest) and (Source,Dest) and at(P,Source)
;THEN 
;DELETE (at(P,Source))
;ADD (at(P,Dest))

(defrule MOVE

	(plane ?p)
	(airport ?source)
	(airport ?dest)
	(connected ?source ?dest)
	?f1 <- (at ?p ?source)
	=>
		(printout t " Plane " ?p " has moved from airport " ?source " at airport" ?source crlf)	
		(retract ?f1)
)

;unload(P,A,C)
;IF plane(P)  and  airport(A) and cargo(C) and at(P,A) and loaded(C,P)
;THEN 
;DELETE (loaded(C,P))
;ADD (is-in(C, A))
;ADD (empty(P))

(defrule UNLOAD

	(plane ?p)
	(airport ?a)
	(cargo ?c)
	(at ?p ?a)
	?f1 <- (loaded ?c ?p)
	=>
		(printout t " Plane " ?p " has unloaded cargo " ?c crlf)	
		(retract ?f1)
		(is-in ?c ?a)
		(empty ?p)

)

; we need a status

; KB
(deffacts initial
	(plane p1)  
	(plane p2)
	(airport Rome)	
	(airport Paris)
	(airport Wien)
	(cargo c1)
	(cargo c2)
	(cargo c3)
	(is-in c1 Paris)
	(is-in c2 Rome)
	(is-in c3 Rome)
	(empty p1)	
	(empty p2)
	(at p1 Rome)	
	(at p2 Wien)
	(connected Rome Wien)

	;final status
	(goal c1 Wien)
	(goal c2 Wien)
)