p([1,2,3,4,5]).

%% simple linked list
%% http://www.cse.unsw.edu.au/~billw/prologdict.html#list
%% 
% ?- ['/path/to/repo/ai-lab/prolog/example_list.pl'].
% /path/to/repo/ai-lab/prolog/example_list.pl compiled 0.00 sec, 2 clauses true.
%% ========
% ?- p(X).
% X = [1, 2, 3, 4, 5].
%% ========
%% the point is the functor, substitues f()
%% notation needed to define a list: .(Head, Tail)
% ?- X = .(a, .(b,[])).
% X = [a, b].
%% ========
%% the tail must be a list, while tail Head need not be.
%% alternate notation: [Head | Tail]
% ?- X = .(a, .(b,c)).
% X = [a, b|c].
%% ========
% ?- X = .(a,b).
% X = [a|b].
%% ========
%% allows to get the first element of th e list and the rest of the list
% ?- p([X|Y]).
% X = 1,
% Y = [2, 3, 4, 5].
%% ========
%% put at the Head a new value, zero. assign that to a new variable
% ?- p(X), Y = [0|X].
% X = [1, 2, 3, 4, 5],
% Y = [0, 1, 2, 3, 4, 5].
%% ========
%% the underscore identifies every values
%% this gives the value between a value ????
% ?- p([_, X | _]).
% X = 2.
%% ========
%% assigns to X the Tail of the list p, assigns to Y the concatenation of 0 and X
% ?- p([_|X]), Y = [0|X].
% X = [2, 3, 4, 5],
% Y = [0, 2, 3, 4, 5].

%% ========
%% member: built-in predicate
%% ========
%% ricorsione di code
member(X, [X | _]).

member(X, [_|T]):- member(X,T).

%% ========
%% what is an element of the list? (gets all list elements)
% ?- member(X, [b, a, c]).
% X = b ;
% X = a ;
% X = c.

%% ========
% ?- member(a,L). % una qualunque lista che inizia con a e continua con qualcosa
% L = [a|_G884] ;
% L = [_G883, a|_G887] ;
% L = [_G883, _G886, a|_G890] ;

%% ========
% ?- member(X, [a,b,c,d]).
% X = a ;
% X = b ;
% X = c ;
% X = d ;
% false.

% ?- member(X, [a,b,c,d]), X=eeeee.
% false.

%% backtracking, 
% ?- member(X, [a,b,c,d]), write(X), X=d.
% abcd
% X = d ;
% false.

%% ======================
%% concatenate two lists
%% ======================

% qulunque lista vuota (param1) concatenata con L (param2) restituisce una nuova lista L (param3)
concat2([], L, L).
% per ogni lista non vuota la cui testa è H e la coda Y, concatena T con L,
% poi devo rimettere la testa H e restituisco una nuova lista [H|T1]
concat2([H|T], L, [H|T1]) :- concat2(T, L, T1).

%% EXAMPLES 
% ?- concat2([a,b],[c,d],L). % concat two list, [a,b] and [c,d] in L.
% L = [a, b, c, d].

% ?- concat2(X, [c,d], [a,b,c,d]).
% X = [a, b] ;
% false.

% ?- concat2(X, Y, [a,b,c,d]).
% X = [],
% Y = [a, b, c, d] ;
% X = [a],
% Y = [b, c, d] ;
% X = [a, b],

%% ================
%% reversing a list
%% ================