% Prolog example
hello :- write('Hello, World!'), nl.

parent(tom, bob).
parent(tom, liz).
parent(bob, ann).

grandparent(X, Z) :- parent(X, Y), parent(Y, Z).