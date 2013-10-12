% ex2.1

borrow(rucker,book(neuromancer,author(william_gibson))).
borrow(stephenson,book(the_schismatrix,author(bruce_sterling))).
borrow(gibson,book(snowcrash,author(neal_stephenson))).
borrow(gibson,book(ulysses,author(james_joyce))).

%% find the person who borrowed the book Neuromancer
% ?- borrow(X, book(neuromancer, _)).
% X = rucker ;
% false.

%% borrow(rucker,book(neuromancer,author(william_gibson))).
%% can be rendered graphically as a tree
  
%%             borrow
%%             /     \
%%            /       \
%%        rucker      book
%%                   /     \
%%            neuromancer  author
%%                           |
%%                    william_gibson