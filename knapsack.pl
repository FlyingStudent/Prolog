%solving the knapsack problem using prolog.

%summing tems in an array.
sum_of_items([],0).
sum_of_items([H|T],Sum):-
    sum_of_items(T,Temp_Sum),
    integer(H),
    Sum is Temp_Sum+ H.
%base case
knapsack([],_,[]).
%case 2 : object included
knapsack([Next|Others],Target,[Next|Rest]):-
    Next =< Target,
    Remainder is Target-Next,
   once( knapsack(Others,Remainder,Rest)).
%case 2 : object not included
knapsack([_|Others],Target,Load):-
    knapsack(Others,Target,Load).

