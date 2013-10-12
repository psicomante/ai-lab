% file: ex2_conjunction

age(john, 30).
age(andrea,20).
age(john, 32).
age(paul,32).
age(jennifer,25).

%% do exist two people wich name is john OR paul and they are same age?
% ?- age(john, X),age(paul, X).
% X = 32.
%%%% comma is AND

%% do exist two people wich name is john OR paul and they are same age?
% ?- age(john, X);age(paul, X).
% X = 30 ;
% X = 32 ;
% X = 32.

sister(alice,frank).
sister(lara,frank).
sister(alice,anna).
sister(anna,alice).
sister(alice,julia).
sister(julia,alice).
sister(lara,micaela).
sister(micaela,lara).
sister(donna,lara).
sister(lara,donna).

friend(lara,julia).
friend(julia,lara).
friend(anna,micaela).
friend(micaela,anna).

%% QUESTIONS
%% do exist two friends, one of them has a sister named "alice" and the other has a sister named "lara"?

% ?- friend(X,Y),sister(X, alice),sister(Y, lara).
% X = anna,
% Y = micaela ;
% false.

