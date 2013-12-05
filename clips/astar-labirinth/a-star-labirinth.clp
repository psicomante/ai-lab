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

; Checks if the goal is reached
;
; LHS: current NODE-ID is the goal
; RHS: allows the print of the solution
(defrule achieved-goal
  (declare (salience 100))
  (current ?id)
  (goal ?r ?c)
  (node (ident ?id) (pos-r ?r) (pos-c ?c) (gcost ?g))

  =>
    (printout t " Exist solution for goal (" ?r "," ?c ") with cost "  ?g crlf)
    (assert (print ?id))
)

; Prints the found solution
;
; LHS: checks if the "print fact" is present and ...
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

; Checks the possibility to expand to UP Cell
(defrule up-apply
  (declare (salience 50))
  ; current node
  (current ?curr)
  ; "loads" the current-node position
  (node (ident ?curr) (pos-r ?r) (pos-c ?c) (open yes))
  ; checks if the cell above the current node is valid
  (cell (pos-r =(+ ?r 1)) (pos-c ?c) (contains empty|gate))

  =>
    ; the node UP relative to the current node is openable
    (assert (apply ?curr up ?r ?c))
)

; Execs
;
; LHS: current node, last node and the apply fact
; LHS: current node with its G cost and the goal in order to calculate f(n) = g(n) + h(n)
; RHS: exec fact with start node position,
;      newnode with ident+1, pos-r+1, pos-c,
;              gcost+1 (arc weight is always 1)
;              fcost = abs(goal.x - (current.x+1)) + abs(goal.y - current.c) + g(n) + 1
;      retract the apply fact

(defrule up-exec
  (declare (salience 50))
  ; current node (ident)
  (current ?curr)
  ; last node
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
    ; change the focus on the module NEW to execute the NEWNODE
    (focus NEW)
)

; Checks the possibility to expand to DOWN Cell
(defrule down-apply

  (declare (salience 50))
  (current ?curr)
  (node (ident ?curr) (pos-r ?r) (pos-c ?c) (open yes))
  (cell (pos-r =(- ?r 1)) (pos-c ?c) (contains empty|gate))

  =>
    (assert (apply ?curr down ?r ?c))
)


(defrule down-exec

  (declare (salience 50))
  (current ?curr)
  (lastnode ?n)
  ?f1<- (apply ?curr down ?r ?c)
  (node (ident ?curr) (gcost ?g))
  (goal ?x ?y)

   =>
      (assert
        (exec ?curr (+ ?n 2) down ?r ?c)
        (newnode
          (ident (+ ?n 2))
          (pos-r (- ?r 1))
          (pos-c ?c)
          (gcost (+ ?g 1))
          (fcost (+ (abs (- ?x (- ?r 1))) (abs (- ?y ?c)) ?g 1))
          father ?curr)
        )
      )

      (retract ?f1)
      (focus NEW)
)

; Checks the possibility to expand to RIGHT Cell
(defrule right-apply

  (declare (salience 50))
  (current ?curr)
  (node (ident ?curr) (pos-r ?r) (pos-c ?c) (open yes))
  (cell (pos-c =(+ ?c 1)) (pos-r ?r) (contains empty|gate))
  =>
    (assert (apply ?curr right ?r ?c))
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

; Checks the possibility to expand to LEFT Cell
(defrule left-apply

  (declare (salience 50))
  (current ?curr)
  (node (ident ?curr) (pos-r ?r) (pos-c ?c) (open yes))
  (cell (pos-c =(- ?c 1)) (pos-r ?r) (contains empty|gate))
  =>
    (assert (apply ?curr left ?r ?c))
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

; LHS: newnode
(defrule check-closed
  (declare (salience 50))
  ?f1 <-  (newnode (ident ?id) (pos-r ?r) (pos-c ?c))
  (node (ident ?old) (pos-r ?r) (pos-c ?c) (open no))
  ?f2 <-    (alreadyclosed ?a)

  =>
    (assert (alreadyclosed (+ ?a 1)))
    (retract ?f1)
    (retract ?f2)
    (pop-focus)
)



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


; Adds to the opened-nodes-set the *newnode* just added from a "exec" rule
;
; LHS: takes the newnode and its data, takes the number of nodes in the opened-nodes-set
; RHS: assert the node and its status (open yes)
;      increments the number of opened-nodes
;      return to the MAIN module
(defrule add-open

  (declare (salience 49))
  ?f1 <- (newnode (ident ?id) (pos-r ?r) (pos-c ?c) (gcost ?g) (fcost ?f)(father ?anc))
  ?f2 <- (numberofnodes ?a)

    =>
      (assert
        (node (ident ?id) (pos-r ?r) (pos-c ?c) (gcost ?g) (fcost ?f)(father ?anc) (open yes))
      )
      (assert (numberofnodes (+ ?a 1)))
      (retract ?f1 ?f2)
      (pop-focus)
)