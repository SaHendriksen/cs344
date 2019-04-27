% Sarah Hendriksen
% CS 344
% Lab 12
% Exercise 12.2

% a) From LPN!
% i) Exercise 2.1, questions 1, 2, 8, 9, 14 - Give the necessary instantiations.

% 1) bread  =  bread.
% 		true.

% 2) ’Bread’  =  bread.
% 		false.

% 8) food(X)  =  food(bread).
%		X = bread
%		true.

% 9) food(bread,X)  =  food(Y,sausage).
%		X = sausage,
%		Y = bread.
%		true.

% 14) meal(food(bread),X)  =  meal(X,drink(beer)).
%		false.
%		This is because X can't be instantiated as both food(bread) and drink(beer)

% ************* NOT WORKING ************


% ii) Exercise 2.2 - Explain how Prolog does its unification and reasoning. If you have issues getting the results you’d expect, are there things you can do to game the system?

house_elf(dobby). 
witch(hermione). 
witch('McGonagall'). 
witch(rita_skeeter). 
magic(X):-  house_elf(X). 
% magic(X):-  wizard(X). 
magic(X):-  witch(X).

% 1) ?-  magic(house_elf).
%			false.

% 2) ?-  wizard(harry).
%			Undefined procedure: wizard/1

% 3) ?-  magic(wizard).
%			false.

% 4) ?-  magic(’McGonagall’).
%			true.

% 5) ?-  magic(Hermione).
%			Hermione = dobby ;
%			Hermione = hermione ;
%			Hermione = 'McGonagall' ;
%			Hermione = rita_skeeter.

% ? - magic(Hermione)
% 	Hermione = _G34
% 		? - house_elf(_G34)
%			_G34 = dobby
%				|     |
%		? - wizard(_G34)
%				XXX
%		? - witch(_G34)
%			_G34 = hermione
%				|     |
%			_G34 = 'McGonagall'
%				|     |
%			_G34 = rita_skeeter
%				|     |
% Formatting wasn't holding when I uploaded it - so I did more of a hierarchy. Let me know if you don't understand how this demonstrates the graph

% In order to get the prolog to work, I needed to comment out magic(X) :- wizard(X). because wizard(X) refers to an undefined procedure and makes it so all the queries return undefined procedure.


% b) Does inference in propositional logic use unification? Why or why not?
% Propositional logic does support unification. It allows for the combination of two rules that overlap to be combined - for example, it allows for modus ponens. Modus ponens unifys p -> q and p to be unified to q.

% c) Does Prolog inferencing use resolution? Why or why not?
% Yes, Prolog does use resolution as the inference engine behind it.