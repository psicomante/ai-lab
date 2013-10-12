% file: ex3_rules.pl

% defining the fact parent 
parent(pam,tom).
parent(tom,bob).
parent(tom,jim).

% defining the rule: if parent(X,Y) => son(Y,X)
% son(Y,X) is a new fact.
son(Y,X) :- parent(X,Y).

% if (son(X,Z) and son(Y,Z)) => brother(X,Y)
% if there are X and Y, sons of the same parent Z then X and Y are brothers
% brother(X,Y) :- son(X,Z),son(Y,Z). % produce answers with errors. bob and jim brothers of themselves
brother(X,Y) :- son(X,Z),son(Y,Z),X\=Y.

% QUESTIONS
% who's bob's son?
% ?- son(bob,X).
% X = tom.

% find a X and Y / X is son of Y
% ?- son(X,Y).

% brothers
% ?- brother(A,B).
% A = bob,
% B = jim ;
% A = jim,
% B = bob ;
% false.

grand(X,Y) :- parent(X,Z),parent(Z,Y).

% ?- grand(X,Y).
% X = pam,
% Y = bob ;
% X = pam,
% Y = jim ;

% pam's grandsons
% ?- grand(pam,N).

% trace pam's grandsons, step with "c"
% ?- trace, grand(pam,N).   

% ?- trace,grand(pam,N).
%   Call: (7) grand(pam, _G1459) ? creep
%   Call: (8) parent(pam, _G1576) ? creep
%   Exit: (8) parent(pam, tom) ? creep
%   Call: (8) parent(tom, _G1459) ? creep
%   Exit: (8) parent(tom, bob) ? creep
%   Exit: (7) grand(pam, bob) ? creep
% N = bob .
