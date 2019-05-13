% God created all things.  
godCreated(X) :- thing(X).

% If something is a substance, it is a thing.  
thing(X) :- substance(X).

% Evil is the lack of goodness that ought to be there.  
privation(evil, good).

% Evil isn't an additional substance.
not(substance(X)) :- privation(X, Y).
substance(Y) :- privation(X, Y).

% Therefore, God didn't create evil.  
