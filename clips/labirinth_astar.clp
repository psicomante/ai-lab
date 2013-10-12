(defmodule MAIN (export ?ALL))

(deftemplate node 
	(slot ident) 
	;gcost: entrance cost
	(slot gcost) 
	;fcost: estimated cost to the goal
	(slot fcost)
	;father: node father - it needs for the path
	(slot father)
	;pos-r: node position row
	(slot pos-r)
	;pos-c: node position column
	(slot pos-c)
	;open: open node
	(slot open)
)

(deftemplate newnode 
	(slot ident) 
	(slot gcost) 
	(slot fcost) 
	(slot father) 
	(slot pos-r)
  (slot pos-c)
)

(deftemplate cell 
	(slot pos-r)
	(slot pos-c)
	(slot contains (allowed-values  wall gate empty))
)

;   Labirinth Graphics Representation
;   - - - - - - - -
;   |W|W|W|W|W|G|W|W|W|W|W|W|W|G|W|W|	10
;    - - - - - - - - - - - - - - - -
;   |W| | | |W| | |W| | | | |W| | |W|	9
;    - - - - - - - - - - - - - - - -
;   |W| | | |W| | |W| | | | |W| | |W|	8
;    - - - - - - - - - - - - - - - -
;   |W| | | |W| | |W|W|W| | |W|W| |W|	7
;    - - - - - - - - - - - - - - - -
;   |W| | | |W| | | | |W| | |W| | |G|	6
;    - - - - - - - - - - - - - - - -
;   |W| | | |W| | |W| |W| |W|W| |W|W|	5
;    - - - - - - - - - - - - - - - -
;   |W| |W| | | | |W| | | | |W| | |W|	4
;    - - - - - - - - - - - - - - - -
;   |W| |W| | |W|W|W|W| |W|W|W|W| |W	3
;    - - - - - - - - - - - - - - - -
;   |W| | |W|W| | |W| | |W| |W| | |W	2
;    - - - - - - - - - - - - - - - -
;   |W| | | | | | |W| | | | | | |W|W|	1
;    - - - - - - - - - - - - - - - -
;   |W|W|W|W|G|W|W|W|W|W|W|W|G|W|W|W|	0
;    - - - - - - - - - - - - - - - -
;    0 1 2 3 4 5 6 7 8 9 101112131415

; map domain 
(deffacts domain
  (cell (pos-r 0) (pos-c 0) (contains wall))
	(cell (pos-r 0) (pos-c 1) (contains wall))
	(cell (pos-r 0) (pos-c 2) (contains wall))
	(cell (pos-r 0) (pos-c 3) (contains wall))
	(cell (pos-r 0) (pos-c 4) (contains gate))
	(cell (pos-r 0) (pos-c 5) (contains wall))
	(cell (pos-r 0) (pos-c 6) (contains wall))
	(cell (pos-r 0) (pos-c 7) (contains wall))
  (cell (pos-r 0) (pos-c 8) (contains wall))
	(cell (pos-r 0) (pos-c 9) (contains wall))
	(cell (pos-r 0) (pos-c 10) (contains wall))
	(cell (pos-r 0) (pos-c 11) (contains wall))
	(cell (pos-r 0) (pos-c 12) (contains gate))
	(cell (pos-r 0) (pos-c 13) (contains wall))
	(cell (pos-r 0) (pos-c 14) (contains wall))
	(cell (pos-r 0) (pos-c 15) (contains wall))
	(cell (pos-r 1) (pos-c 0) (contains wall))
	(cell (pos-r 1) (pos-c 1) (contains empty))
	(cell (pos-r 1) (pos-c 2) (contains empty))
	(cell (pos-r 1) (pos-c 3) (contains empty))
	(cell (pos-r 1) (pos-c 4) (contains empty))
	(cell (pos-r 1) (pos-c 5) (contains empty))
	(cell (pos-r 1) (pos-c 6) (contains wall))
	(cell (pos-r 1) (pos-c 7) (contains empty))
  (cell (pos-r 1) (pos-c 8) (contains empty))
	(cell (pos-r 1) (pos-c 9) (contains empty))
	(cell (pos-r 1) (pos-c 10) (contains empty))
	(cell (pos-r 1) (pos-c 11) (contains empty))
	(cell (pos-r 1) (pos-c 12) (contains empty))
	(cell (pos-r 1) (pos-c 13) (contains empty))
	(cell (pos-r 1) (pos-c 14) (contains wall))
	(cell (pos-r 1) (pos-c 15) (contains wall))
	(cell (pos-r 2) (pos-c 0) (contains wall))
	(cell (pos-r 2) (pos-c 1) (contains empty))
	(cell (pos-r 2) (pos-c 2) (contains empty))
	(cell (pos-r 2) (pos-c 3) (contains wall))
	(cell (pos-r 2) (pos-c 4) (contains wall))
	(cell (pos-r 2) (pos-c 5) (contains empty))
	(cell (pos-r 2) (pos-c 6) (contains empty))
	(cell (pos-r 2) (pos-c 7) (contains wall))
  (cell (pos-r 2) (pos-c 8) (contains empty))
	(cell (pos-r 2) (pos-c 9) (contains empty))
	(cell (pos-r 2) (pos-c 10) (contains wall))
	(cell (pos-r 2) (pos-c 11) (contains empty))
	(cell (pos-r 2) (pos-c 12) (contains wall))
	(cell (pos-r 2) (pos-c 13) (contains empty))
	(cell (pos-r 2) (pos-c 14) (contains empty))
	(cell (pos-r 2) (pos-c 15) (contains wall))
	(cell (pos-r 3) (pos-c 0) (contains wall))
	(cell (pos-r 3) (pos-c 1) (contains empty))
	(cell (pos-r 3) (pos-c 2) (contains wall))
	(cell (pos-r 3) (pos-c 3) (contains empty))
	(cell (pos-r 3) (pos-c 4) (contains empty))
	(cell (pos-r 3) (pos-c 5) (contains wall))
	(cell (pos-r 3) (pos-c 6) (contains wall))
	(cell (pos-r 3) (pos-c 7) (contains wall))
  (cell (pos-r 3) (pos-c 8) (contains wall))
	(cell (pos-r 3) (pos-c 9) (contains empty))
	(cell (pos-r 3) (pos-c 10) (contains wall))
	(cell (pos-r 3) (pos-c 11) (contains empty))
	(cell (pos-r 3) (pos-c 12) (contains wall))
	(cell (pos-r 3) (pos-c 13) (contains wall))
	(cell (pos-r 3) (pos-c 14) (contains empty))
	(cell (pos-r 3) (pos-c 15) (contains wall))
	(cell (pos-r 4) (pos-c 0) (contains wall))
	(cell (pos-r 4) (pos-c 1) (contains empty))
	(cell (pos-r 4) (pos-c 2) (contains wall))
	(cell (pos-r 4) (pos-c 3) (contains empty))
	(cell (pos-r 4) (pos-c 4) (contains empty))
	(cell (pos-r 4) (pos-c 5) (contains empty))
	(cell (pos-r 4) (pos-c 6) (contains empty))
	(cell (pos-r 4) (pos-c 7) (contains wall))
  (cell (pos-r 4) (pos-c 8) (contains  empty))
	(cell (pos-r 4) (pos-c 9) (contains  empty))
	(cell (pos-r 4) (pos-c 10) (contains wall))
	(cell (pos-r 4) (pos-c 11) (contains  empty))
	(cell (pos-r 4) (pos-c 12) (contains wall))
	(cell (pos-r 4) (pos-c 13) (contains  empty))
	(cell (pos-r 4) (pos-c 14) (contains  empty))
	(cell (pos-r 4) (pos-c 15) (contains wall))
	(cell (pos-r 5) (pos-c 0) (contains wall))
	(cell (pos-r 5) (pos-c 1) (contains empty))
	(cell (pos-r 5) (pos-c 2) (contains empty))
	(cell (pos-r 5) (pos-c 3) (contains empty))
	(cell (pos-r 5) (pos-c 4) (contains wall))
	(cell (pos-r 5) (pos-c 5) (contains empty))
	(cell (pos-r 5) (pos-c 6) (contains empty))
	(cell (pos-r 5) (pos-c 7) (contains wall))
  (cell (pos-r 5) (pos-c 8) (contains  empty))
	(cell (pos-r 5) (pos-c 9) (contains wall))
	(cell (pos-r 5) (pos-c 10) (contains wall))
	(cell (pos-r 5) (pos-c 11) (contains wall))
	(cell (pos-r 5) (pos-c 12) (contains wall))
	(cell (pos-r 5) (pos-c 13) (contains  empty))
	(cell (pos-r 5) (pos-c 14) (contains wall))
	(cell (pos-r 5) (pos-c 15) (contains wall))
	(cell (pos-r 6) (pos-c 0) (contains wall))
	(cell (pos-r 6) (pos-c 1) (contains empty))
	(cell (pos-r 6) (pos-c 2) (contains empty))
	(cell (pos-r 6) (pos-c 3) (contains empty))
	(cell (pos-r 6) (pos-c 4) (contains wall))
	(cell (pos-r 6) (pos-c 5) (contains empty))
	(cell (pos-r 6) (pos-c 6) (contains empty))
	(cell (pos-r 6) (pos-c 7) (contains  empty))
  (cell (pos-r 6) (pos-c 8) (contains  empty))
	(cell (pos-r 6) (pos-c 9) (contains wall))
	(cell (pos-r 6) (pos-c 10) (contains  empty))
	(cell (pos-r 6) (pos-c 11) (contains  empty))
	(cell (pos-r 6) (pos-c 12) (contains wall))
	(cell (pos-r 6) (pos-c 13) (contains  empty))
	(cell (pos-r 6) (pos-c 14) (contains  empty))
	(cell (pos-r 6) (pos-c 15) (contains gate))
	(cell (pos-r 7) (pos-c 0) (contains wall))
	(cell (pos-r 7) (pos-c 1) (contains empty))
	(cell (pos-r 7) (pos-c 2) (contains empty))
	(cell (pos-r 7) (pos-c 3) (contains empty))
	(cell (pos-r 7) (pos-c 4) (contains wall))
	(cell (pos-r 7) (pos-c 5) (contains empty))
	(cell (pos-r 7) (pos-c 6) (contains empty))
	(cell (pos-r 7) (pos-c 7) (contains wall))
  (cell (pos-r 7) (pos-c 8) (contains wall))
	(cell (pos-r 7) (pos-c 9) (contains wall))
	(cell (pos-r 7) (pos-c 10) (contains  empty))
	(cell (pos-r 7) (pos-c 11) (contains  empty))
	(cell (pos-r 7) (pos-c 12) (contains wall))
	(cell (pos-r 7) (pos-c 13) (contains wall))
	(cell (pos-r 7) (pos-c 14) (contains  empty))
	(cell (pos-r 7) (pos-c 15) (contains wall))
	(cell (pos-r 8) (pos-c 0) (contains wall))
	(cell (pos-r 8) (pos-c 1) (contains empty))
	(cell (pos-r 8) (pos-c 2) (contains empty))
	(cell (pos-r 8) (pos-c 3) (contains empty))
	(cell (pos-r 8) (pos-c 4) (contains wall))
	(cell (pos-r 8) (pos-c 5) (contains empty))
	(cell (pos-r 8) (pos-c 6) (contains empty))
	(cell (pos-r 8) (pos-c 7) (contains wall))
  (cell (pos-r 8) (pos-c 8) (contains  empty))
	(cell (pos-r 8) (pos-c 9) (contains  empty))
	(cell (pos-r 8) (pos-c 10) (contains  empty))
	(cell (pos-r 8) (pos-c 11) (contains  empty))
	(cell (pos-r 8) (pos-c 12) (contains wall))
	(cell (pos-r 8) (pos-c 13) (contains  empty))
	(cell (pos-r 8) (pos-c 14) (contains  empty))
	(cell (pos-r 8) (pos-c 15) (contains wall))
	(cell (pos-r 9) (pos-c 0) (contains wall))
	(cell (pos-r 9) (pos-c 1) (contains empty))
	(cell (pos-r 9) (pos-c 2) (contains empty))
	(cell (pos-r 9) (pos-c 3) (contains empty))
	(cell (pos-r 9) (pos-c 4) (contains wall))
	(cell (pos-r 9) (pos-c 5) (contains empty))
	(cell (pos-r 9) (pos-c 6) (contains empty))
	(cell (pos-r 9) (pos-c 7) (contains wall))
  (cell (pos-r 9) (pos-c 8) (contains  empty))
	(cell (pos-r 9) (pos-c 9) (contains  empty))
	(cell (pos-r 9) (pos-c 10) (contains  empty))
	(cell (pos-r 9) (pos-c 11) (contains  empty))
	(cell (pos-r 9) (pos-c 12) (contains wall))
	(cell (pos-r 9) (pos-c 13) (contains  empty))
	(cell (pos-r 9) (pos-c 14) (contains  empty))
	(cell (pos-r 9) (pos-c 15) (contains wall))
	(cell (pos-r 10) (pos-c 0) (contains wall))
	(cell (pos-r 10) (pos-c 1) (contains wall))
	(cell (pos-r 10) (pos-c 2) (contains wall))
	(cell (pos-r 10) (pos-c 3) (contains wall))
	(cell (pos-r 10) (pos-c 4) (contains wall))
	(cell (pos-r 10) (pos-c 5) (contains gate))
	(cell (pos-r 10) (pos-c 6) (contains wall))
	(cell (pos-r 10) (pos-c 7) (contains wall))
  (cell (pos-r 10) (pos-c 8) (contains wall))
	(cell (pos-r 10) (pos-c 9) (contains wall))
	(cell (pos-r 10) (pos-c 10) (contains wall))
	(cell (pos-r 10) (pos-c 11) (contains wall))
	(cell (pos-r 10) (pos-c 12) (contains wall))
	(cell (pos-r 10) (pos-c 13) (contains gate))
	(cell (pos-r 10) (pos-c 14) (contains wall))
	(cell (pos-r 10) (pos-c 15) (contains wall))
)

; status 0
; - initial node
; - current 
; - lastnode
; - open-worse
; - open-better
; - numberofnodes
(deffacts S0
	(node (ident 0) (gcost 0) (fcost 0) (father NA) (pos-r 0) (pos-c 4) (open yes)) 
  (current 0)
  (lastnode 0)
  (open-worse 0)
  (open-better 0)
  (alreadyclosed 0)
	(numberofnodes 0)
)

; goal position
(deffacts final
  (goal 10 5)
)

(defrule achieved-goal
	(declare (salience 100))
  (current ?id)
  (goal ?r ?c)
  (node (ident ?id) (pos-r ?r) (pos-c ?c) (gcost ?g))  

  => 
  	(printout t " Exist solution for goal (" ?r "," ?c ") with cost "  ?g crlf)
  	(assert (print ?id))
)

(defrule print-solution
	(declare (salience 101))
	?f <- (print ?id)
	(node (ident ?id) (father ?anc&~NA))  
	(exec ?anc ?id ?oper ?r ?c)

	=>
		(printout t " Executing action " ?oper " from state (" ?r "," ?c ") " crlf)
		(assert (print ?anc))
		(retract ?f)
)

(defrule print-end
	(declare (salience 102))
	(print ?id)
	(node (ident ?id) (father ?anc&NA))
	(open-worse ?worse)
	(open-better ?better)
	(alreadyclosed ?closed)
	(numberofnodes ?n )  

	=> 
		(printout t " stati espansi " ?n crlf)
		(printout t " stati generati già in closed " ?closed crlf)
		(printout t " stati generati già in open (open-worse) " ?worse crlf)
		(printout t " stati generati già in open (open-better) " ?better crlf)

   (halt)

)

(defrule up-apply
	(declare (salience 50))
  (current ?curr)
  (node (ident ?curr) (pos-r ?r) (pos-c ?c) (open yes))
  (cell (pos-r =(+ ?r 1)) (pos-c ?c) (contains empty|gate))

  => 
  	(printout t " Executing action " ?oper " from state (" ?r "," ?c ") " crlf)
		(assert (apply ?curr up ?r ?c))
)

(defrule up-exec
	(declare (salience 50))
	(current ?curr)
	(lastnode ?n)
	?f1 <- (apply ?curr up ?r ?c)
	(node (ident ?curr) (gcost ?g))
	(goal ?x ?y)

  =>

  	(assert 
  		(exec ?curr (+ ?n 1) up ?r ?c)
			(newnode 
				(ident (+ ?n 1)) 
				(pos-r (+ ?r 1)) 
				(pos-c ?c) 
				(gcost (+ ?g 1)) 
				(fcost (+ (abs (- ?x (+ ?r 1))) (abs (- ?y ?c)) ?g 1))
				(father ?curr)
			)
		)

		(retract ?f1)
		(focus NEW)
)

(defrule down-apply

        (declare (salience 50))

        (current ?curr)

        (node (ident ?curr) (pos-r ?r) (pos-c ?c) (open yes))

        (cell (pos-r =(- ?r 1)) (pos-c ?c) (contains empty|gate))

   => (assert (apply ?curr down ?r ?c))

              )



(defrule down-exec

        (declare (salience 50))

        (current ?curr)

        (lastnode ?n)

 ?f1<-  (apply ?curr down ?r ?c)

        (node (ident ?curr) (gcost ?g))
        (goal ?x ?y)

   => (assert (exec ?curr (+ ?n 2) down ?r ?c)

              (newnode (ident (+ ?n 2)) (pos-r (- ?r 1)) (pos-c ?c) 

                       (gcost (+ ?g 1)) (fcost (+ (abs (- ?x (- ?r 1))) (abs (- ?y ?c)) ?g 1))
                       (father ?curr)))

      (retract ?f1)

      (focus NEW))





(defrule right-apply

        (declare (salience 50))

        (current ?curr)

        (node (ident ?curr) (pos-r ?r) (pos-c ?c) (open yes))

        (cell (pos-c =(+ ?c 1)) (pos-r ?r) (contains empty|gate))

   => (assert (apply ?curr right ?r ?c))

              )



(defrule right-exec

        (declare (salience 50))

        (current ?curr)

        (lastnode ?n)

 ?f1<-  (apply ?curr right ?r ?c)

        (node (ident ?curr) (gcost ?g))
        (goal ?x ?y)

   => (assert (exec ?curr (+ ?n 3) right ?r ?c)

              (newnode (ident (+ ?n 3)) (pos-c (+ ?c 1)) (pos-r ?r) 

                       (gcost (+ ?g 1)) (fcost (+ (abs (- ?y (+ ?c 1))) (abs (- ?x ?r)) ?g 1))
                       (father ?curr)))

              (retract ?f1)

              (focus NEW))





(defrule left-apply

        (declare (salience 50))

        (current ?curr)

        (node (ident ?curr) (pos-r ?r) (pos-c ?c) (open yes))

        (cell (pos-c =(- ?c 1)) (pos-r ?r) (contains empty|gate))

   => (assert (apply ?curr left ?r ?c))

              )



(defrule left-exec

        (declare (salience 50))

        (current ?curr)

        (lastnode ?n)

 ?f1<-  (apply ?curr left ?r ?c)

        (node (ident ?curr) (gcost ?g))
        (goal ?x ?y)

   => (assert (exec ?curr (+ ?n 4) left ?r ?c)

              (newnode (ident (+ ?n 4)) (pos-c (- ?c 1)) (pos-r ?r) 

                       (gcost (+ ?g 1)) (fcost (+ (abs (- ?y (- ?c 1))) (abs (- ?x ?r)) ?g 1))
              (father ?curr)))

      (retract ?f1)

      (focus NEW))







(defrule change-current

         (declare (salience 49))

?f1 <-   (current ?curr)

?f2 <-   (node (ident ?curr))

         (node (ident ?best&:(neq ?best ?curr)) (fcost ?bestcost) (open yes))

         (not (node (ident ?id&:(neq ?id ?curr)) (fcost ?gg&:(< ?gg ?bestcost)) (open yes)))

?f3 <-   (lastnode ?last)

   =>    (assert (current ?best) (lastnode (+ ?last 5)))

         (retract ?f1 ?f3)

         (modify ?f2 (open no))) 



(defrule close-empty

         (declare (salience 49))

?f1 <-   (current ?curr)

?f2 <-   (node (ident ?curr))

         (not (node (ident ?id&:(neq ?id ?curr))  (open yes)))

     => 

         (retract ?f1)

         (modify ?f2 (open no))

         (printout t " fail (last  node expanded " ?curr ")" crlf)

         (halt))                



(defmodule NEW (import MAIN ?ALL) (export ?ALL))



(defrule check-closed

(declare (salience 50)) 

 ?f1 <-    (newnode (ident ?id) (pos-r ?r) (pos-c ?c))

           (node (ident ?old) (pos-r ?r) (pos-c ?c) (open no))

 ?f2 <-    (alreadyclosed ?a)

    =>

           (assert (alreadyclosed (+ ?a 1)))

           (retract ?f1)

           (retract ?f2)

           (pop-focus))



(defrule check-open-worse

(declare (salience 50)) 

 ?f1 <-    (newnode (ident ?id) (pos-r ?r) (pos-c ?c) (gcost ?g) (father ?anc))

           (node (ident ?old) (pos-r ?r) (pos-c ?c) (gcost ?g-old) (open yes))

           (test (or (> ?g ?g-old) (= ?g-old ?g)))

 ?f2 <-    (open-worse ?a)

    =>

           (assert (open-worse (+ ?a 1)))

           (retract ?f1)

           (retract ?f2)

           (pop-focus))



(defrule check-open-better

(declare (salience 50)) 

 ?f1 <-    (newnode (ident ?id) (pos-r ?r) (pos-c ?c) (gcost ?g) (fcost ?f) (father ?anc))

 ?f2 <-    (node (ident ?old) (pos-r ?r) (pos-c ?c) (gcost ?g-old) (open yes))

           (test (<  ?g ?g-old))

 ?f3 <-    (open-better ?a)

    =>     (assert (node (ident ?id) (pos-r ?r) (pos-c ?c) (gcost ?g) (fcost ?f) (father ?anc) (open yes))

                   )

           (assert (open-better (+ ?a 1)))

           (retract ?f1 ?f2 ?f3)

           (pop-focus))



(defrule add-open

       (declare (salience 49))

 ?f1 <-    (newnode (ident ?id) (pos-r ?r) (pos-c ?c) (gcost ?g) (fcost ?f)(father ?anc))

 ?f2 <-    (numberofnodes ?a)

    =>     (assert (node (ident ?id) (pos-r ?r) (pos-c ?c) (gcost ?g) (fcost ?f)(father ?anc) (open yes))

                   )

           (assert (numberofnodes (+ ?a 1)))

           (retract ?f1 ?f2)

           (pop-focus))