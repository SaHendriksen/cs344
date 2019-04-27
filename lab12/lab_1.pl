% Sarah Hendriksen
% CS 344
% Lab 12
% Exercise 12.1

% a) From LPN!
% i) Exercise 1.4 - Explain why you built the representations as you did.

% 1) Butch is a killer.
killer(butch).

% 2) Mia and Marsellus are married.
married(mia, marsellus).

% 3) Zed is dead.
dead(zed).

% 4) Marsellus kills everyone who gives Mia a footmassage.
kills(marsellus, X):- givesFootMassage(X, mia).

% 5) Mia loves everyone who is a good dancer.
loves(mia, X):- goodDancer(X).

% 6) Jules eats anything that is nutritious or tasty.
eats(jules, X):- nutritious(X) ; tasty(X).

% ii) Exercise 1.5 - Explain how Prolog comes up with its answers.

% 1) wizard(ron).
%		yes

% 2) witch(ron).
%		undefined procedure

% 3) wizard(hermione).
%		no

% 4) witch(hermione).
%		undefined procedure

% 5) wizard(harry).
%		yes

% 6) wizard(Y).
% 		Y = harry ;
%		Y = ron

% 7) witch(Y).
%		undefined procedure


% b) Consider the well-known modus ponens. Does Prolog implement a version of modus ponens in propositional logic form? If so, demonstrate how it’s done; if not, explain why not. If it doesn’t, can you implement one? Why or why not?

q :- p.
p.

% Yes, modus polens can be implemented in Prolog. See code (above) and output (below).

% ? - q.
% RETURN: true.


% c) Prolog supports representations in the form of Horn clauses. Compare and contrast the representational power they provide with that of propositional logic.
% Horn clauses are able to use variables, which is an advantage over propositional logic. However, horn clauses can only imply one thing. Propositional logic on the other hand can imply a conjunction or disjunction of things.


% d) Logical implementations generally distinguish the basic operations of TELL and ASK. Does Prolog support this distinction? If so, how; if not, why not?
% Prolog does support this distinction. You can tell your program what the rules are and then query or ask it things based off of that knowledge.
% Example:
% TELL
anExample(X) :- test(X).
test(example).

% ASK
% ? - anExample(example).
%		true.
