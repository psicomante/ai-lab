; Vacuum Cleaner World, Copyright 2013 Roberto 'psicomante' Pesando
; Released under GPL v2 license
; http://choosealicense.com/licenses/gpl-v2/
;
; How To Use It
; from CLIPS IDE: LOAD -> (script).clp ; load program into memory
; (reset)                              ; first rules matching
; (run)                                ; rule execution and new facts

(defmodule MAIN (export ?ALL))

; ========= TEMPLATES ==============
(deftemplate solution (slot value (default no)))

; vacuum cleaner template
(deftemplate vacuum
  (slot position (type INTEGER))
  (slot direction (type SYMBOL)(default right))
  (slot steps (type INTEGER))
)

; world cell template
(deftemplate cell
  (slot coord (type INTEGER))
  (slot status (default ?NONE) (allowed-values wall dirty clean))
)


; ========= FACTS ============
(deffacts params
  ; left wall discovered?
  (wall-left no)
  ; right wall discovered?
  (wall-right no)
  ; solution == right wall AND left wall both discovered
  (solution (value no))
  ; steps of the vacuum cleaner (= actions)
  (steps 0)
)

; ========= RULES ==============

; goal rule, halt the program if the fact solution (template) has value "yes"
(defrule got-solution
  (declare (salience 100))
  (solution (value yes))
  ?f <- (vacuum)
  =>
    (halt) ; halt execution
)

; rule that moves the vacuum to the right cell
(defrule move-right
  ?f <- (vacuum (position ?x) (direction right) (steps ?s))
  =>
    ; modify vacuum cleaner position (world.x++) and steps done
    ( modify ?f (position (+ ?x 1)) (steps (+ ?s 1)) )
)

; rule that moves the vacuum to the left cell
(defrule move-left
  ?f <- (vacuum (position ?x) (direction left) (steps ?s))

  =>
    ; modify vacuum cleaner position (world.x++) and steps done
    (
      modify ?f (position (- ?x 1)) (steps (+ ?s 1))
    )
)

; clean action: change cell status and incrments steps
(defrule clean
  (declare (salience 50))
  ?v <- (vacuum (position ?x) (steps ?s))
  ?f <- (cell (coord ?x) (status dirty))

  =>
    (modify ?f (status clean))
    (modify ?v (steps (+ ?s 1)))
)

(defrule stop-left
  (declare (salience 40))
  ?f <- (vacuum (position ?x) (direction left))
  ?f2 <- (wall-left ?)
  ;
  (cell (coord =(- ?x 1)) (status wall) )

  =>
    (retract ?f2)
    (assert (wall-left yes))
    (modify ?f (direction right))
)

(defrule stop-right
  (declare (salience 40))
  ?f <- (vacuum (position ?x) (direction right))
  ?f2 <- (wall-right ?)
  ;
  (cell (coord =(+ ?x 1)) (status wall) )
  =>
    (retract ?f2)
    (assert (wall-right yes))
    (modify ?f (direction left))
)

(defrule goal
  (declare (salience 90))
  ?f <- (solution (value no))
  (wall-right yes)
  (wall-left yes)
  =>
    (modify ?f (value yes))
)