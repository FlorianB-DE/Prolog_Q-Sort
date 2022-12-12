% quicksort(+List, -SortedList)
quicksort([], []).
quicksort([Pivot | Rest], Sorted) :-
    partition(Rest, Pivot, Left, Right),
    quicksort(Left, SortedLeft),
    quicksort(Right, SortedRight),
    append(SortedLeft, [Pivot | SortedRight], Sorted).

% partition(+List, +Pivot, -Left, -Right)
partition([], _, [], []).
partition([X | Xs], Pivot, [X | Left], Right) :-
    X =< Pivot,
    partition(Xs, Pivot, Left, Right).
partition([X | Xs], Pivot, Left, [X | Right]) :-
    X > Pivot,
    partition(Xs, Pivot, Left, Right).
