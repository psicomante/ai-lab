% CHAPTER 1: The Basics
% ====================================
% Prolog has its roots in first-order logic, a formal logic. 
% Prolog is declarative.
% That means, when implementing the solution to a problem, instead of specifying how
% to achieve a certain goal in a certain situation, we specify *what* the situation (rules and
% facts) and the goal (query) are and let the Prolog interpreter derive the solution for
us. P
% 
% Relations and queries are constructed using Prolog's single data type, the term. 
% Relations are defined by clauses. 
% 
% Given a query, the Prolog engine attempts to find a resolution refutation of the negated query. 
% If the negated query can be refuted, i.e., an instantiation for all free variables is found that makes the 
% union of clauses and the singleton set consisting of the negated query false, it follows that the original query, 
% with the found instantiation applied, is a logical consequence of the program. 

% 
% FACTS AND RULES
% ----------------------
% There are only three basic constructs in Prolog: facts, rules, and queries.
% A collection of facts and rules is called a knowledge base (or a database)
% 
% INTRO: QUERIES
% --------------
% So how do we use a Prolog program? By posing queries.
%
% OPERATORS
% ---------
% :-, \+, !, etc.
% 
% THIS FILE
% ---------
% Facts: Predicates and Propositions; Queries;

% owns is called "functor", while john and restaurant are called "components" or "terms"
% "functor" and "predicates" are not distint entities in prolog

owns(john,restaurant).				% John owns a restaurant
owns(john,house).							% John owns a house

owns(paul, dock).

brothers(john,paul).					% John and Paul are brothers

is_in(roma, italia).					% Roma is in Italia
is_in(genova, italia).				% Genova is in Italia
is_in(new_york, usa).					% New York is in Usa
is_in(los_angeles, usa).			% Los Angeles is in Usa

usa.		% proposition
italia.

% QUESTIONS
% ---------

%% does john own a house?
% ?- owns(john, house).
% true.

%% Who owns what
% ?- owns(X,Y).
% X = john,
% Y = restaurant ;
% X = john,
% Y = house.

%% What john owns
% ?- owns(john, X).
% X = restaurant ;
% X = house.

%% What cities are in italy
% ?- is_in(X, italia).
% X = roma ;
% X = genova.