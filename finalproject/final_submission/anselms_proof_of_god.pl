% The unbeliever says, "No God"
unbeliever.
saysNoGod :- unbeliever.

% The unbeliever has an idea of God.
ideaOfGod :- saysNoGod.

% God exists in the mind - ideas have mental existence
existsInMind(god) :- ideaOfGod.

% Definition: God is that (being) than which nothing greater can be thought
% Perfect Being Theology: being with all possible greatmaking properties - "perfections"
god :- nothingGreaterCanBeThought, existsInMind(god), existsInReality(god).

% If a being exists only in the mind and if that being might have existed in reality,
% then, that being might have been greater than being actually is.
greaterThanThought(X) :- existsInMind(X), existsInReality(X).

% Assumption for reductio: God exists only in the mind
assumption.
existsInMind(god) :- assumption.

% God might have existed in reality
existsInReality(god).

% God might have been greater than God actually is
% We can think of something greater than God
% We can think of something greater than the greatest possible thing we can think of
greaterThanGreatest :- greaterThanThought(god).

% Assumption for reductio is false
nothingGreaterCanBeThought :- greaterThanGreatest.

% Therefore God exists in reality and in the mind


% For query purposes:
existsOnlyInMind(X) :- existsInMind(X), not(existsInReality(X)).