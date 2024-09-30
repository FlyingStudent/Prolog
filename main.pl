/*
int SumRangeRecursively(int x, int y, int total)
{
    if (x == y)
    {
        total = x;
        return total ;

    }
    if (x <= y)
        return SumRangeRecursively(x + 1, y, total) +x;
    
    if(x>= y)
        return SumRangeRecursively(x,y+1,total) +y;
    return total;
}
*/
%my predicate is sum_range(X,Y,R)
%base case
sum_range(X,Y,R):-
                    X == Y , R = X.

%recursive Case
sum_range(X,Y,R):-
X<Y,
                    X1 is X+1,
                    sum_range(X1,Y,R1),
                    R is R1 + X.
sum_range(X,Y,R):-
X>Y,
                    Y1 is Y+1,
                    sum_range(X,Y1,R1),
                    R is R1 + Y.
%(factorial)fact(0,1),fact(1,1),fact(N,R)
%base case 
factorial(0,1).
%recursive case
factorial(N,R):-
N>0,
N1 is N-1,
 factorial(N1,R1),
R is R1 * N1.


/*
sister
borther





*/