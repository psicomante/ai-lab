;ESEMPIO 2
;Si noti che l'esempio illustra bene solo le problematiche di
;pattern matching in fatti non ordinati , mentre lascia a desiderare per la semantica
;(non controlla casi di omonimia, per cui � possibile che nipote sia pi� vecchio del nonno)

(deftemplate person  (slot name)  (slot age)  (slot father))


(deffacts people  (person (name Joe) (age 20) ( father Bill))
                  (person (name Bob) (age 20)  (father Tom))
                  (person (name Joe) (age 34) (father Luis))
                  (person (name Sue) (age 34) (father Luis))
                  (person (name Sue) (age 20)  (father George))
                  (person (name Bill) (age 54) (father Joseph))
                  (person (name Joseph) (age 81)(father Bob))
                  )


; regola che controlla il nome Joe e usa ?x per asserire
(defrule getperson1
  (person (name Joe) (age ?x))
  =>  (assert (eta Joe ?x))
)

;
(defrule getperson2
  (person (age ?x&20|21|22) (name ?y))
  => (assert (eta ?y ?x))
)

; per ogni X il cui padre e Y e per ogni Y il cui padre è Z, asserisce che Z sia nonno di X
(defrule grandparent
 	(person (name ?x) (father ?y))
 	(person (name ?y) (father ?z))
 	=> (assert (gp ?z ?x))
)