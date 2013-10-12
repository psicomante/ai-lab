(defmodule MAIN (export ?ALL))

; ========= TEMPLATES ==============
(deftemplate solution (slot value (default no)))

; ========= FACTS ============
(deffacts param
  (solution (value no))
  (maxdepth 6)
)

(deffacts S0
  (status 0 clear a NA)
  (status 0 on a b)
  (status 0 ontable b NA)
  (status 0 ontable c NA)
  (status 0 clear c NA)
  (status 0 handempty NA NA)
)

(deffacts final
  (goal on a b)
  (goal ontable c NA)
  (goal on b c)
)

; ========= RULES ==============
(defrule got-solution
  (declare (salience 100))
  (solution (value yes))
  =>
    (halt)
)

(defrule pick
  (status ?s on ?x ?y)
  (status ?s clear ?x ?)
  (status ?s handempty ? ?)
  (maxdepth ?d)
  (test (< ?s ?d))
  (not (exec ?s pick ?x ?y))

  =>
    (assert (apply ?s pick ?x ?y))
)

(defrule apply-pick1
        (apply ?s pick ?x ?y)
 ?f <-  (status ?t ? ? ?)
        (test (> ?t ?s))
 =>     (retract ?f))

(defrule apply-pick2
       (apply ?s pick ?x ?y)
?f <-  (exec ?t ? ? ?)
       (test (> ?t ?s))
 =>    (retract ?f))

(defrule apply-pick3
?f <- (apply ?s pick ?x ?y)
 =>    (retract ?f)
      (assert (delete ?s on ?x ?y))
      (assert (delete ?s clear ?x NA))
      (assert (delete ?s handempty NA NA))
      (assert (status (+ ?s 1) clear ?y NA))
      (assert (status (+ ?s 1) holding ?x NA))
      (assert (current ?s))
      (assert (news (+ ?s 1)))
      (focus CHECK)
      (assert (exec ?s pick ?x ?y )))

(defrule picktable
   (status ?s ontable ?x ?)
   (status ?s clear ?x ?)
   (status ?s handempty ? ?)
   (maxdepth ?d)
   (test (< ?s ?d))
   (not (exec ?s picktable ?x NA))
   => (assert (apply ?s picktable ?x NA)))

(defrule apply-picktable1
        (apply ?s picktable ?x ?y)
 ?f <-  (status ?t ? ? ?)
        (test (> ?t ?s))
 =>     (retract ?f))

(defrule apply-picktable2
        (apply ?s picktable ?x ?y)
?f <-  (exec ?t ? ? ?)
       (test (> ?t ?s))
 =>    (retract ?f))

(defrule apply-picktable3
?f <- (apply ?s picktable ?x ?y)
 =>   (retract ?f)
      (assert (delete ?s ontable ?x NA))
      (assert (delete ?s clear ?x NA))
      (assert (delete ?s handempty NA NA))
      (assert (status (+ ?s 1) holding ?x NA))
      (assert (current ?s))
      (assert (news (+ ?s 1)))
      (focus CHECK)
      (assert (exec ?s picktable ?x NA)))

(defrule put
   (status ?s holding ?x ?)
   (status ?s clear ?y ?)
   (maxdepth ?d)
   (test (< ?s ?d))
   (not (exec ?s put ?x ?y))
   => (assert (apply ?s put ?x ?y)))

(defrule apply-put1
        (apply ?s put ?x ?y)
 ?f <-  (status ?t ? ? ?)
        (test (> ?t ?s))
 =>     (retract ?f))

(defrule apply-put2
        (apply ?s put ?x ?y)
 ?f <-  (exec ?t ? ? ?)
        (test (> ?t ?s))
 =>     (retract ?f))

(defrule apply-put3
?f <- (apply ?s put ?x ?y)
 =>   (retract ?f)
      (assert (delete  ?s holding ?x NA))
      (assert (delete  ?s clear ?y NA))
      (assert (status (+ ?s 1) on ?x ?y))
      (assert (status (+ ?s 1) clear ?x NA))
      (assert (status (+ ?s 1) handempty NA NA))
      (assert (current ?s))
      (assert (news (+ ?s 1)))
      (focus CHECK)
      (assert (exec ?s put ?x ?y)))

(defrule puttable
   (status ?s holding ?x ?)
   (maxdepth ?d)
   (test (<  ?s  ?d))
   (not (exec ?s puttable ?x NA))
   => (assert (apply ?s puttable ?x NA)))

(defrule apply-puttable1
        (apply ?s puttable ?x ?y)
 ?f <-  (status ?t ? ? ?)
        (test (> ?t ?s))
 =>     (retract ?f))

(defrule apply-puttable2
        (apply ?s puttable ?x ?y)
 ?f <-  (exec ?t ? ? ?)
        (test (> ?t ?s))
 =>     (retract ?f))

(defrule apply-puttable3
?f <- (apply ?s puttable ?x ?y)
 =>    (retract ?f)(assert (delete ?s holding ?x NA))
      (assert (status (+ ?s 1) ontable ?x NA))
      (assert (status (+ ?s 1) clear ?x NA))
      (assert (status (+ ?s 1)handempty NA NA))
      (assert (current ?s))
      (assert (news (+ ?s 1)))
      (focus CHECK)
      (assert (exec ?s puttable ?x NA)))

(defmodule CHECK (import MAIN ?ALL) (export ?ALL))

(defrule comp
    (declare (salience 100))
    (current ?s)
    (status ?s ?op ?x ?y)
    (not (delete ?s ?op ?x ?y))
 => (assert (status (+ ?s 1) ?op ?x ?y)))

(defrule goal-not-yet
      (declare (salience 50))
      (news ?s)
      (goal ?op ?x ?y)
      (not (status ?s ?op ?x ?y))
      => (assert (task go-on))
         (assert (ancestor (- ?s 1)))
         (focus NEW))

(defrule solution-exist
 ?f <-  (solution (value no))
         =>
        (modify ?f (value yes))
        (pop-focus))

(defmodule NEW (import CHECK ?ALL) (export ?ALL))

(defrule check-ancestor
    (declare (salience 50))
?f1 <- (ancestor ?a)
    (or (test (> ?a 0)) (test (= ?a 0)))
    (news ?s)
    (status ?s ?op ?x ?y)
    (not (status ?a ?op ?x ?y))
    =>
    (assert (ancestor (- ?a 1)))
    (retract ?f1)
    (assert (diff ?a)))

(defrule all-checked
       (declare (salience 25))
       (diff 0)
?f2 <- (news ?n)
?f3 <- (task go-on) =>
       (retract ?f2)
       (retract ?f3)
       (focus DEL))

(defrule already-exist
?f <- (task go-on)
      => (retract ?f)
         (assert (remove newstate))
         (focus DEL))

(defmodule DEL (import NEW ?ALL))

(defrule del1
(declare (salience 50))
?f <- (delete $?)
=> (retract ?f))

(defrule del2
(declare (salience 100))
?f <- (diff ?)
=> (retract ?f))

(defrule del3
(declare (salience 25))
       (remove newstate)
       (news ?n)
 ?f <- (status ?n ?  ? ?)
=> (retract ?f))

(defrule del4
(declare (salience 10))
?f1 <- (remove newstate)
?f2 <- (news ?n)
=> (retract ?f1)
   (retract ?f2))

(defrule done
 ?f <- (current ?x) =>
(retract ?f)
(pop-focus)
(pop-focus)
(pop-focus))