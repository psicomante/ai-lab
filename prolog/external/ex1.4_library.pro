% simulates a library lending system

% people with card
subscribed(john_von_neumann).
subscribed(edsger_dijkstra).

% books in inventory
inventory(rudy_rucker_wetware).
inventory(william_gibson_neuromancer).
inventory(bruce_sterling_the_schismatrix).
 
% i prestiti 
available(rudy_rucker_wetware).
available(william_gibson_neuromancer).

can_consult(X,Y) :- subscribed(X),inventory(Y),available(Y).