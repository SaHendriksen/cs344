% manicheanism_god_and_evil.pl
% Implements in Prolog the Manicheanism thought on the relationship between a Creator God and evil
%
% Author: Sarah Hendriksen (srh34) for CS 344 at Calvin College
% Date: May, 2019

% God created all things.  
godCreated(X) :- thing(X).

% Evil is a substance.  
substance(evil).

% If something is a substance, it is a thing.  
thing(X) :- substance(X).

% Therefore, God created evil.  