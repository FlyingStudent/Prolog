%add marriage relatoinships and refine the .
%add lists and refine the use of rules(lists at the start by grouping and then as a family which it should be from the)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%INSTRUCTIONS%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/*
1- human(X): returns true if X is  human, otherwise false
2-masculin(X):returns true if X is masculine, otherwise false
3-feminine(X):returns true if X is feminine, otherwise false
4-mother(X,Y):returns true if Y was the mother of X, otherwise false
5-father(X,Y):returns true if Y was the father of X, otherwise false
*/

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%FACTS%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%entering ayman to the KB
human(ayman).
masculin(ayman).
mother(ayman,wafeqaa).
%entering jehan to the KB
human(jehan).
masculin(jehan).
%entering hassan to the KB
human(hassan).
masculin(hassan).
father(hassan,maher).
mother(hassan,hala).
%entering zaid to the KB
human(zaid).
masculine(zaid).
father(zaid,maher).
mother(zaid,hala).
%entering maram to the KB
human(maram).
feminine(maram).
father(maram,maher).
mother(maram,hala).
%entering waleed to the KB
human(waleed).
masculine(waleed).
father(waleed,mahmood).
%entering saaed to the KB
human(saaed).
masculine(saaed).
mother(saaed,wafeqaa).
%entering wafeqaa to the KB
human(wafeqaa).
feminine(wafeqaa).
%entering mahmood to the KB
human(mahmood).
masculine(mahmood).
mother(mahmood,wafeqaa).
%entering Khalid to the KB
human(khalid).
masculine(khalid).
mother(khalid,wafeqaa).
%entering Shadi to the KB
human(shadi).
masculine(shadi).
father(shadi,khalid).
%entering ali to the KB
human(ali).
masculine(ali).
father(ali,hassan).
%entering dave to the KB
human(dave).
masculine(dave).
father(dave,maher).
mother(dave,hala).
%entering hala to the KB
human(hala).
feminine(hala).
father(hala,hani).
mother(hala,eman).
%entering maher to the KB
human(maher).
masculine(maher).
mother(maher,wafeqaa).
%entering huda to the KB
human(huda).
feminine(huda).
mother(huda,eman).
%entering hani to the KB
human(hani).
masculine(hani).
%entering eman to the KB
human(eman).
feminine(eman).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%RULES%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% mother rule(1):
mother(X,Y):-
human(X),human(Y),feminine(Y),child(Y,X).
% father rule(2):
father(X,Y):-
human(X),human(Y),masculin(Y),child(Y,X).
% sister rule(3):
sister(X,Y):-
 X\=Y,
human(X),human(Y),feminine(X),masculin(Y),
father(X,Z),father(Y,Z);
 X\=Y,  
human(X),human(Y),masculin(Y),feminine(X),
father(X,Z),father(Y,Z);
 X\=Y,
human(X),human(Y),feminine(Y),feminine(X),
father(X,Z),father(Y,Z);
 X\=Y,
human(X),human(Y),feminine(X),masculin(Y),
mother(X,Z),mother(Y,Z);
 X\=Y,
human(X),human(Y),masculin(Y),feminine(X),
mother(X,Z),mother(Y,Z);
 X\=Y,
human(X),human(Y),feminine(Y),feminine(X),
mother(X,Z),mother(Y,Z).
% brother rule(4):
brother(X,Y):-
 X\=Y,
human(X),human(Y),masculin(X),masculin(Y),
    father(X,Z),father(Y,Z);
     X\=Y,
    human(X),human(Y),masculin(X),masculin(Y),
    mother(X,Z),mother(Y,Z).
% grandmother rule(5):
grandmother(X,Y):-
  X \=Y,
human(X),human(Y),feminine(Y),child(Y,Z),father(X,Z);
  X \=Y,
human(X),human(Y),feminine(Y),child(Y,Z),mother(X,Z).
% grandfather rule(6):
grandfather(X,Y):-
  X \= Y,
human(X),human(Y),masculin(Y),child(Y,Z),father(X,Z);
  X \=Y,
human(X),human(Y),masculin(Y),child(Y,Z),mother(X,Z).
%child rule(7):
child(X,Y):-
   human(X),human(Y), mother(Y,X) ; human(X),human(Y),father(Y,X).
 %sibiling rule(8):
  sibling(X,Y):-
   X\=Y,
   human(X),human(Y),father(X,Z), father(Y,Z);
   X\=Y,
   human(X),human(Y),mother(X,Z),mother(Y,Z);
   X\=Y,
   human(X),human(Y),sibling(X,Z),sibling(Y,Z).
% cousine rule(9):
cousine(X,Y):-
   human(X),human(Y),  father(X,Z1), father(Y,Z2),sibling(Z1,Z2);
      human(X),human(Y), mother(X,Z1),mother(Y,Z2), sibling(Z1,Z2);
         human(X),human(Y),father(X,Z1),mother(Y,Z2), sibling(Z1,Z2);
            human(X),human(Y), mother(X,Z1), father(Y,Z2),sibling(Z1,Z2).
% aunt rule(10):
aunt(X,Y):-
X\=Y,
human(X),human(Y),mother(X,Z),sister(Z,Y);
X\=Y,
human(X),human(Y),father(X,Z),sister(Z,Y).
% uncle rule(11):
uncle(X,Y):-
X\=Y,
human(X),human(Y),mother(X,Z),brother(Z,Y);
X\=Y,
human(X),human(Y),father(X,Z),brother(Z,Y).
% grandchild rule(12):
grandchild(X,Y):-

    human(X),human(Y),grandmother(Y,X);
     human(X),human(Y),grandmother(Y,X).
%%%%%%%%%%%%%%%%%%%%%%%%%%%defingin ancestor,descendant procedures%%%%%%%%%%%%%%%%
%parent rule(13):
parent(X,Y):- mother(X,Y).
parent(X,Y):- father(X,Y).
%ancestor rule(14):
ancestor(X,Y):- parent(X,Y).
ancestor(X,Y):- parent(X,Z),ancestor(Z,Y).
%descendant rule(15):
descendant(X,Y):- child(X,Y).
descendant(X,Y):- child(X,Z), descendant(Z,Y).