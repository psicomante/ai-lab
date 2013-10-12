; CLIPS (forward-chaingin) starts examinating rules from the bottom list of facts

; example:
; examinate: last fact (f8)
; f8: what rules can be activated with this fact?

(deffacts data-facts
  (data 1.0 blue "red")
  (data 1 blue)
  (data 1 blue red)
  (data 1 blue RED)
  (data 1 blue red 6.9)
)

(deftemplate person
  (slot name)
  (slot age)
  (multislot friends)
)

(deffacts people
  (person (name Joe) (age 20))
  (person (name Bob) (age 20))
  (person (name Joe) (age 34))
  (person (name Sue) (age 34))
  (person (name Sue) (age 20))
)

(defrule find-data 
  (data 1 blue red) 
=> (assert (rule find-data activated)))

(defrule Find-Bob 
  (person (name Bob) (age 20)) 
=> (assert (rule Find-Bob activated))
)

; ? match every value
; $? match one or more parameters

(defrule find-data-with-vars
  (data ? blue red $?)
  =>)

; match every fact except the first one

(defrule find-data-with-vars2
  (data 1 $?)
  =>)