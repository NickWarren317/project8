% Helper predicate to check the condition
check_condition(Pay, 'eq', Ref) :- Pay =:= Ref.
check_condition(Pay, 'ne', Ref) :- Pay =\= Ref.
check_condition(Pay, 'gt', Ref) :- Pay > Ref.
check_condition(Pay, 'ge', Ref) :- Pay >= Ref.
check_condition(Pay, 'lt', Ref) :- Pay < Ref.
check_condition(Pay, 'le', Ref) :- Pay =< Ref.


list(Op, Ref, List) :-
    findall([First, Last, Pay], (pay(First, Last, Pay), check_condition(Pay, Op, Ref)), List).

count(Op, Ref, Count) :-
    findall(Pay, (pay(_, _, Pay), check_condition(Pay, Op, Ref)), Results),
    length(Results, Count).

min(Op, Ref, Min) :-
    findall(Pay, (pay(_, _, Pay), check_condition(Pay, Op, Ref)), Pays),
    min_list(Pays, Min).

max(Op, Ref, Max) :-
    findall(Pay, (pay(_, _, Pay), check_condition(Pay, Op, Ref)), Pays),
    max_list(Pays, Max).

total(Op, Ref, Total) :-
    findall(Pay, (pay(_,_, Pay), check_condition(Pay, Op, Ref)), Pays),
    sum_list(Pays, Total).

avg(Op, Ref, Avg) :-
    total(Op, Ref, Total),
    count(Op, Ref, Count),
    Avg is Total / Count.
