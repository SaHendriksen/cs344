% THE ARGUMENT FROM EVIL

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
god :- \+ evil.

% FREE WILL DEFENSE

% God is good.
allGood(god).

% God would want moral goodness.
moralGood :- allGood(god).

% In order to have moral goodness, there must be freedom.
freedom :- moralGood.

% If there is freedom, both moral goodness and moral evil are possible.
% moralGood :- freedom
moralEvil :- freedom.

% Logically, if there is freedom, God and evil can both be possible in the same world.
god :- moralGood.
evil :- moralEvil.

bothExist(X, Y) :- X, Y.