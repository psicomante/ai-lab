% non-monotonic reasoning

% Example1: birds and penguins
flies(X) :- bird(X), \+ abnormal(X). % flies(X) if bird(X) and not(abnormal(X))
abnormal(X) :- penguin(X).					 % abnormal(X) if penguin(X)
bird(X) :- penguin(X).							 % bird(X) if penguin(X)

bird(tweety).
penguin(john).

% Example2: jobs
% page 209: programmazione logica

free(X) :- adult(X), \+ busy(X).

busy(john).
adult(john).
adult(carl).

% Example2: questions

% ?- free(carl).
% true.

% ?- free(john).
% false.

% ?- free(X). %% IT DOESN'T WORK!
% false.