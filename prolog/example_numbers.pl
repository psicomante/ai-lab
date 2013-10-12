%% numbers

% ?- X = 2+3.
% X = 2+3.
%% interprets as value "2+3"

%% to make aritmetics
% ?- X is 2+3.
% X = 5.

%% lega il valore 5 a X, non è un assegnamento, infatti
% ?- X is 2+3, X is 14+2.
%% da errore perché si chiede se X = 5 e X = 16

% X is 2+Y, Y = 5.
% valute da sinistra a destrae da errore perché Y non è ancora legata
