%Arithmetic Operatoins
%is/2
%length/2


%list
/*
writing length/2 procedure to compute the length of a prolog list
*/
%base case
len([],0).
len([_|T],Size):-
    len(T,Temp_Size),
    Size is Temp_Size+1.

%summing tems in an array.
sum_of_items([],0).
sum_of_items([H|T],Sum):-
    sum_of_items(T,Temp_Sum),
    integer(H),
    Sum is Temp_Sum+ H.

%counting the length of a list and its sub-lists elements

list_and_sublists_len([],0).
list_and_sublists_len([H|T],TotalLength):-
    is_list(H),
    list_and_sublists_len(H,SublistLength),
    list_and_sublists_len(T,TailLength),
    TotalLength is SublistLength + TailLength +1.

list_and_sublists_len([_|T],TotalLength):-
    list_and_sublists_len(T,TailLength),
    TotalLength is TailLength + 1
    ,!.
    %practicing relatoinal operations
%max_2
max_2(N1,N2,N2):-
N2>=N1,
!.
max_2(N1,N2,N1):-
N1>N2.
%max_in_list
max_in_list([N],N).
max_in_list([H,N|T],Max):-
max_in_list([N|T],Max_in_tail),
max_2(H,Max_in_tail,Max),!.
%min_2
min_2(N1,N2,N2):-
N2=<N1,
!.
min_2(N1,N2,N1):-
N1<N2.


 