% God created all things.  
godCreated(X) :- thing(X).

% Evil is a substance.  
substance(evil).

% If something is a substance, it is a thing.  
thing(X) :- substance(X).

% Therefore, God created evil.  