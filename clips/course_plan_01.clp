(deftemplate studente  (slot matr) (slot nome) (slot residenza) 
(slot iscritto-laurea) (slot univ))

(deftemplate carico-didattico (slot matr) (slot corso))

(deffacts listastud 
        (studente (matr 22000) (nome Giorgio) (residenza aosta) (iscritto-laurea informatica) (univ To))
        (studente (matr 21000) (nome Anna) (residenza cuneo) (iscritto-laurea biologia) (univ To))
        (studente (matr 22004) (nome Davide) (residenza torino) (iscritto-laurea informatica) (univ To))
        (studente (matr 22005) (nome Sara) (residenza torino) (iscritto-laurea informatica) (univ To))
        (studente (matr 22003) (nome Marco) (residenza ivrea) (iscritto-laurea matematica) (univ To))
        (studente (matr 22008) (nome Paolo) (residenza torino) (iscritto-laurea informatica) (univ To)))
 
(deffacts corsiseguiti
        (carico-didattico (matr 22000) (corso progI))
        (carico-didattico (matr 22000) (corso progII))
        (carico-didattico (matr 22000) (corso DB))
        (carico-didattico (matr 22000) (corso Alg))
        (carico-didattico (matr 22000) (corso RetiDiElaboratori))
        
       (carico-didattico (matr 22004) (corso progI))
        (carico-didattico (matr 22004) (corso progII))
        (carico-didattico (matr 22004) (corso DB))
        (carico-didattico (matr 22005) (corso Alg))
        (carico-didattico (matr 22005) (corso progI))
	(carico-didattico (matr 22005) (corso progII))
	(carico-didattico (matr 22005) (corso DB))
        (carico-didattico (matr 22005) (corso SistInt))
        (carico-didattico (matr 22005) (corso IumTWeb))
       (carico-didattico (matr 22005) (corso Sicurezza))
)

(deffacts scelteind (indirizzo 22000 RSI) (indirizzo 22005 IC))


(defrule r1
        (studente (iscritto-laurea informatica) (univ To) (matr ?x))
         => (assert  
               (corso-da-inserire ?x progI) 
               (corso-da-inserire ?x progII) 
               (corso-da-inserire ?x DB)
               (corso-da-inserire ?x Alg)))

(defrule r2
        (studente (iscritto-laurea informatica) (univ To)  (matr ?x))
	(indirizzo ?x RSI)
       => (assert  (corso-da-inserire ?x RetiDiElaboratori)
                         (corso-da-inserire ?x Sicurezza)))

(defrule r3
        (studente (iscritto-laurea informatica) (univ To)  (matr ?x))
	(indirizzo ?x IC)
       => (assert  (corso-da-inserire ?x SistInt)
                       (corso-da-inserire ?x IumTWeb)))

(defrule r4
        (corso-da-inserire ?x ?y)
        (not (carico-didattico (matr ?x) (corso ?y)))
        => (assert (manca ?x ?y)))

(defrule r5
        (manca ?x ?y)
        (studente (matr ?x) (nome ?z))
        =>
        (printout t crlf crlf)
        (printout t " Nel piano di studio di  " ?z  " manca corso "  ?y)
        (printout t crlf crlf))


(defrule r6
        (studente (matr ?x) (nome ?z))
        (indirizzo ?x ?w)
        (not (manca ?x ?y))
      =>
        (printout t crlf crlf)
        (printout t " Piano di studio di  " ?z  " non viola vincoli ")
        (printout t crlf crlf))
 