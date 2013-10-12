; == USAGE ==
; from CLIPS IDE: LOAD -> restaurant.clp
; (reset)
; (run)


; == RULES ==

(defrule r1 
  (patrons none)
=> (assert (action go-out)))

(defrule r2 
  (patrons some)
=> (assert (action wait)))

(defrule r3
  (patrons full)
  (hungry no)
=> (assert (action go-out)))

(defrule r4
  (patrons full)
  (hungry yes)
  (type Italian)
=> (assert (action go-out)))

(defrule r6
  (patrons full)
  (hungry yes)
  (type burger)
=> (assert (action wait)))

(defrule r7
  (patrons full)
  (hungry yes)
  (type Thai)
  (fri-sat no)
=> (assert (action go-out)))


(defrule r8
  (patrons full)
  (hungry yes)
  (type Thai)
  (fri-sat yes)
=> (assert (action wait)))

(defrule r9
  (action wait)
  )

; == FACTS ==

(deffacts initial
   (fri-sat yes ) 
   (patrons full)
   (type Thai)
   (cost expensive)
   (hungry yes)
   (rain yes)
)

; == RESULT ==
; RULE 8 activated and fact (action wait) added