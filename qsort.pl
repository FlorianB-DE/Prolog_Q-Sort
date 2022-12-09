qs([],[]).
qs([M|L], Sortiert) :- teile(M, L, Kleiner, Groesser),
                        qs(Kleiner, Ksortiert),
                        qs(Groesser, Gsortiert),
                        append(Ksortiert, [M|Gsortiert], Sortiert).
append([], L, L).
append([H|T], L2, [H|L3]) :- append(T, L2, L3).

teile(_, [], [], []).
teile(M, [E|L], [E|L2], L3) :- E =< M, teile(M, L, L2, L3).
teile(M, [E|L], L2, [E|L3]) :- M < E, teile(M, L, L2, L3).
