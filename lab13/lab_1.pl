% Sarah Hendriksen
% Lab 13
% Exercise 13.1

% Do the following exercises
% a) Do these exercises from LPN!
% i) Exercise 3.2
in(X, Y) :- directlyIn(X, Y).
in(X, Z) :- directlyIn(X, Y), directlyIn(Y, Z).

directlyIn(katarina, olga).
directlyIn(olga, natasha).
directlyIn(natasha, irina).

% ? - in(katarina, natasha).
%		true.
% ? - in(olga, katarina).
%		false.

% ii) Exercise 4.5
tran(eins,one). 
tran(zwei,two). 
tran(drei,three). 
tran(vier,four). 
tran(fuenf,five). 
tran(sechs,six). 
tran(sieben,seven). 
tran(acht,eight). 
tran(neun,nine).

listtrans([], []).
listtrans([G|X], [E|Y]) :- tran(G, E), listtrans(X, Y).

% ? - listtrans([eins, drei, neun], X).
%		X = [one, three, nine].
% ? - listtrans(X, [one, four, five]).
%		X = [eins, vier, fuenf]


% b) Does Prolog implement a version of generalized modus ponens (i.e., modus ponens with variables and instatiation)? 
% 	 so, demonstrate how it’s done; if not, explain why not. If it doesn’t, can you implement one? Why or why not?
human(socrates).
mortal(X) :- human(X).

% ? - mortal(socrates).
%		true.

% % Yes, modus polens can be implemented in Prolog with variables and instatiation. See code and output (above).