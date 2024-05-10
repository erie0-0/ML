%ques1 sum

sum(X,Y,S):-
	S is X+Y.

%ques2

max(X,Y,Z):-
	X>Y,
	Z is X.
max(X,Y,Z):-
	Z is Y.

%ques3

factorial(0,1).
factorial(X,Z):-
	X>0,
	X1 is X-1,
	factorial(X1,Z1),
	Z is Z1*X.

%ques4

fib(1,0).
fib(2,1).
fib(X,R):-
	N1 is X-1,
	fib(N1,F1),
	N2 is X-2,
	fib(N2,F2),
	R is F1+F2.

%ques5

gcd(X, Y) :- X == 0 -> write(Y);
             Y == 0 -> write(X);
             X == Y -> write(X);
             X > Y -> (Z is X - Y, gcd(Z, Y));
             Y > X -> (C is Y - X, gcd(X, C)).

%ques6

power(0, Power, 0) :- Power > 0.
power(Num, 0, 1) :- Num > 0.
power(Num, Power, Ans) :- Num > 0, Power > 0,
                          P1 is Power - 1,
                          power(Num, P1, A1),
                          Ans is A1 * Num.

%ques7

multi(N, 1, N).
multi(N1, N2, R) :- T is N2 - 1,
                    multi(N1, T, Y),
                    R is Y + N1.

%ques8

memb(X, [X|_]) :- !.                
memb(X, [_|L]) :- memb(X, L).

%ques9

conc([], L, L) :- !.                    
conc([H|T], L2, [H|R]) :- conc(T, L2, R). 

%ques10

conc([], L, L) :- !.                       
conc([H|T], L2, [H|R]) :- conc(T, L2, R).  
reverse([], []) :- !.                      
reverse([H|T], R) :- reverse(T, RT),       
                     conc(RT, [H], R). 
%ques11
palindrome(L):-
	reverse(L,L).

%ques12
sumlist([],0).
sumlist([X|L1],S):-
	sumlist(L1,S1),
	S is S1+X.
%ques13
evenlength([]).
evenlength([_|T]):-
	oddlength(T).
oddlength([_|T]):-
	evenlength(T).

%ques14
nth_element(1, [X|_], X).
nth_element(K,[_|L],X):-
	nth_element(K1,L,X),
	K is K1+1.

%ques15
maxlist([X],X).
maxlist([H|T],M):- 
	maxlist(T,M1), 
	H<M1 -> M is M1;
	M is H.

%ques16
insert_nth(I, 1, L, [I|L]).
insert_nth(I, N, [H|T], [H|R]):- 
	N1 is N-1,
	insert_nth(I, N1, T, R).

%ques17
delete_nth(1, [_|T], T).
delete_nth(N, [H|T], [H|R]):- 
	N1 is N-1,
	delete_nth(N1, T, R).

%ques18
merge([],L2,L2).
merge(L1,[],L1).
merge([H1|T1],[H2|T2],[H1|T3]):- 
	H1=<H2,
	merge(T1, [H2|T2], T3).
merge([H1|T1],[H2|T2],[H2|T3]):- 
	merge([H1|T1], T2, T3).

%extra all duplicates 
mem(X, [X|_]).
mem(X, [_|T]):- mem(X,T).

duplicates([],[]):-!.
duplicates([H|T], R):- mem(H,T), duplicates(T,R).
duplicates([H|T], [H|R]):- duplicates(T,R).

%occurence
delete(_,[],[]):-!.
delete(X,[X|T],T1):- delete(X,T,T1).
delete(X,[H|T], [H|T1]):-delete(X,T,T1).

