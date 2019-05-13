% argument_from_evil.pl
% Implements in Prolog the counter argument for God's existence based on the existence of evil
%
% Author: Sarah Hendriksen (srh34) for CS 344 at Calvin College
% Date: May, 2019

% God is omnipotent: all-powerful, omniscient: all-knowing, and omnibenevolent.
omnipotent(god).
allPowerful(X) :- omnipotent(X).
omniscient(god).
allKnowing(X) :- omniscient(X).
omnibenevolent(god).
allGood(X) :- omnibenevolent(X).

% If a being is omnipotent, he/she would be able to (have the power to) prevent evil.
preventEvil(X) :- omnipotent(X).

% If a being is omniscient, he/she would know how to prevent evil.
preventEvil(X) :- omniscient(X).

% If a being is omnibenevolent, he/she would want to prevent evil.
preventEvil(X) :- omnibenevolent(X).

% If a being who is omnipotent, omniscient, and omnibenevolent exists, then evil would not exist.
stopEvil(X) :- omnipotent(X), omniscient(X), omnibenevolent(X), preventEvil(X).

% If God exists, then evil would not exist.
stopEvil(god) :- god.

% Evil does exist.
evil.

% Therefore, God does not exist.
god :- not(evil).


% For query purposes:
bothExist(X, Y) :- X, Y.