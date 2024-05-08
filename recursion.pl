%fib.
fib(0,0).
fib(1,1).
fib(X,Y):-
X> 0,
    A is X-1,
    B is X-2,
    fib(A,R1),fib(B,R2),
    Y is R1 + R2,!.