% file: intersection rule; permutation rule
% working with cut operator (!)

permut([], []).

permut(List, [Element | Permutation]) :-
	select(Element, List, Rest),
	permut(Rest, Permutation).

int([], S2, []).

int([X|REST],S2,[X | REST1]) :-
	member(X, S2), !, int(REST,S2,REST1).

int([_|REST], S2, REST1) :-
	int(REST,S2,REST1).


%% GOALS

% p :- (q[1], ..., q[i], !, q[i+1], q[n])
% (!) cuts all the c

% ?- int([a,b,c],[a,c,d],X).
% X = [a, c].

% OTHER PREDICATES
% ================

%% default predicate: call(G)
%% call is a goal, it is a meta-level
p(X) :- call(X).

% if -> then ; else
% it is the C-like short if: (condition) ? do_x : do_y
G1 -> G2 ; G3.

% fail
fail.

% negation
not G.

% rule negation
not(G) :- call(G), fail.
% if G succeds then fail(not(G))

% not in swi-prolog is \+