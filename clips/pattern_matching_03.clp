%ESEMPIO 3 
 
(deffacts datinum
   (data 3)
   (data 6)
   (data 14)
   (data 1)
)
   
% per ogni data il cui valore sia Y e un altro data il cui valore X tale che X > Y
(defrule example-4
   (data ?y)	
   (data ?x&:(> ?x ?y))
   => (assert (larger ?x ?y))
)

% CLIPS> (get-strategy)
% depth
% CLIPS> (set-strategy breadth)
% (clear) // clear kb
% LOAD??
% (reset) // import facts
% (run)