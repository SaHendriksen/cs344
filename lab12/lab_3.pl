% Sarah Hendriksen
% CS 344
% Lab 12
% Exercise 12.3

witch(X):- burns(X), woman(X), looksLikeAWitch(X), turnsPeopleIntoNewt(X).
burns(X):- wood(X). 
wood(X):- floats(X).
floats(X):- bread(X) ; apples(X) ; smallRocks(X) ; cider(X) ; cherries(X) ; sameWeight(duck, X).

bread(bread).
apples(apples).
smallRocks(small_rocks).
cider(cider).
cherries(cherries).

woman(girl).
sameWeight(duck, girl).
looksLikeAWitch(girl).
turnsPeopleIntoNewt(girl).

% ? - witch(girl).
%		true.