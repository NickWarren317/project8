pay(First, Last, Pay) :- salaried(First, Last, Pay).
pay(First, Last, Pay) :-
    hourly(First, Last, Hours, Rate),
    (
        Hours >= 50 -> Pay is (40 * Rate) + (10 * Rate * 1.5) + (Hours - 50) * Rate * 2.0;
        Hours > 40 -> Pay is (40 * Rate + ((Hours - 40) * Rate * 1.5));
        Hours =< 40 -> Pay is Hours * Rate
    ).
pay(First, Last, Pay) :-
    commission(First, Last, Base, Sales, Rate),
    CommissionPay is Sales * Rate,
    (CommissionPay > Base ->
        Pay is CommissionPay
    ;
        Pay is Base
    ).



